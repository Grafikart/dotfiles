# Migration vers systemd-boot (+ secure boot)

L'objectif est de mettre en place un système de démarrage compatible avec le Secure Boot, pour cela on se débarasse de GRUB au profit de SystemD-Boot avec l'architecture suivante :

```text
UEFI avec Secure Boot
  └─ systemd-boot, signé avec les clés sbctl existantes
       ├─ UKI EndeavourOS normal, signé
       └─ Windows Boot Manager, validé par les clés Microsoft
```

Un UKI (_Unified Kernel Image_) réunit le noyau, le microcode, l'initramfs et la ligne de commande noyau dans un unique exécutable EFI. Cela évite le problème actuel de GRUB : avec Secure Boot actif, GRUB ne peut pas valider le noyau alors que systemd-boot ne charge que des exécutables EFI déjà signés.

## Etapes

### Signature & clefs

Pour la génération des clefs et la signature le plus simple est de se reposer sur [sbctl](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#Assisted_process_with_sbctl)

### Génération de l'image UKI

Identifier d'abord les UUID de la partition racine et de la partition swap :

```bash
findmnt -no SOURCE,FSTYPE,UUID /
lsblk -o NAME,FSTYPE,UUID,MOUNTPOINTS
```

La première commande donne le périphérique et l'UUID du système de fichiers racine, à utiliser pour `root=UUID=…`. Dans la sortie de `lsblk`, repérer la ligne dont le type de système de fichiers est `swap` et utiliser son UUID pour `resume=UUID=…`. Le paramètre `resume=` n'est nécessaire que si l'hibernation est utilisée. Sur cette installation, cela donne :

```text
root   : /dev/nvme1n1p2 — e4428ef4-eb28-466a-b252-9a9b06f8a8e2
resume : /dev/nvme1n1p3 — 0a61e024-2741-4731-a9fc-6ffe34a9f088
```

Copier exactement les paramètres utiles de la ligne de commande actuellement démarrée dans `/etc/kernel/cmdline`, sur une seule ligne.

```text
root=UUID=e4428ef4-eb28-466a-b252-9a9b06f8a8e2 rw quiet resume=UUID=0a61e024-2741-4731-a9fc-6ffe34a9f088 loglevel=3 nowatchdog nvidia-drm.modeset=1
```

On ajoute preset mkinitcpio pour construire l'image `/etc/mkinitcpio.d/linux-uki.preset` :

```bash
ALL_kver="/boot/vmlinuz-linux"
ALL_cmdline="/etc/kernel/cmdline"

PRESETS=('default' 'fallback')

default_uki="/boot/efi/EFI/Linux/endeavouros-linux.efi"

fallback_uki="/boot/efi/EFI/Linux/endeavouros-linux-fallback.efi"
fallback_options="-S autodetect"
```

Puis on peut construire les images :

```bash
sudo install -d -m 0755 /boot/efi/EFI/Linux
sudo mkinitcpio -p linux-uki
```

Le hook `microcode` déjà présent dans `mkinitcpio.conf` incorpore bien `AuthenticAMD.bin`. La présence peut être contrôlée avec :

```bash
sudo lsinitcpio --early /boot/efi/EFI/Linux/endeavouros-linux.efi | grep -E 'microcode|AuthenticAMD'
```

### Chargeur, signatures et tests

`systemd-boot` a été installé et signé, avec la configuration suivante dans `/boot/efi/loader/loader.conf` :

```ini
timeout 8
console-mode keep
editor no
```

L'entrée créée est `Boot0004` (**Linux Boot Manager**). Les tests initiaux ont été effectués de façon temporaire avec `efibootmgr -n 0004`, avant de rendre cette entrée permanente :

```bash
sudo efibootmgr -o 0004,0001,0002,0000,0003
```

Les démarrages suivants ont été validés avec Secure Boot actif :

1. UKI EndeavourOS normal ;
2. UKI EndeavourOS de secours ;
3. Windows Boot Manager, découvert automatiquement par systemd-boot sous l'identifiant `auto-windows`.

Les états validés sont `Secure Boot: ✓ Enabled`, le message noyau `Secure boot enabled` et `Current Entry: endeavouros-linux.efi`.

### Régénération automatique des UKI

Le hook mkinitcpio fourni par Arch appelle `/usr/share/libalpm/scripts/mkinitcpio install`. Lors d'une réinstallation de `linux`, il régénère le preset standard `linux.preset`, mais **pas** le preset local `linux-uki.preset`. Il faut donc ajouter ce hook Pacman local :

`/etc/pacman.d/hooks/95-linux-uki.hook`

```ini
[Trigger]
Type = Path
Operation = Install
Operation = Upgrade
Operation = Remove
Target = usr/lib/initcpio/*
Target = usr/lib/firmware/*
Target = usr/lib/modules/*/extramodules/
Target = usr/src/*/dkms.conf
Target = usr/lib/systemd/systemd
Target = usr/bin/cryptsetup
Target = usr/bin/lvm

[Trigger]
Type = Path
Operation = Install
Operation = Upgrade
Target = usr/lib/modules/*/vmlinuz

[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Target = mkinitcpio
Target = mkinitcpio-git

[Action]
Description = Updating EndeavourOS UKIs...
When = PostTransaction
Exec = /usr/bin/mkinitcpio -p linux-uki
```

Après sa création, reconstruire une fois les images puis tester le hook par une réinstallation du noyau :

```bash
sudo mkinitcpio -p linux-uki
sudo pacman -S linux
```

La transaction doit afficher `Updating EndeavourOS UKIs...`, puis la construction du preset `linux-uki`. Les deux UKI doivent enfin rester signés :

```bash
sudo sbctl verify | grep -E 'endeavouros-linux|systemd|EFI/BOOT/BOOTX64' || true
```

### Fichiers Microsoft et sbctl

Le hook `sbctl` signe les binaires sous `EFI/Microsoft/Boot/`. Cette signature supplémentaire ne retire normalement pas la signature Microsoft existante, mais elle est inutile et peut compliquer les mises à jour Windows ou provoquer une demande BitLocker.

Ne pas utiliser `sbattach --remove` sur les fichiers Microsoft. Pour empêcher leur re-signature future, les retirer uniquement de la base de suivi `sbctl` :

```bash
sudo sbctl list-files | awk '/^\// {print $1}' \
  | grep '^/boot/efi/EFI/Microsoft/' \
  | while IFS= read -r file; do
      sudo sbctl remove-file "$file"
    done
```

Les signatures déjà présentes sont laissées intactes ; une mise à jour Windows remplacera ses binaires par ses propres versions signées. Tester ensuite Windows depuis systemd-boot, avec la clé de récupération BitLocker disponible si BitLocker est utilisé.
