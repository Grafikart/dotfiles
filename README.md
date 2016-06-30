# Install

Les trucs chiant à installer sont dans le dossier install

```
git clone git@github.com:Grafikart/dotfiles.git .grafikart
chmod +x -R install

./install/....
```

# Quelques astuces 

## App utiles

Une liste d'application à installer avec l'OS

- **easystroke**, permet de mapper les boutons "pouces" de la souris sur des macros (on trouve le bouton avec `xev | grep button`

## Contrôler spotify au clavier 

Pour controler Spotify au clavier rajouter des racourcis vers ces commandes

```
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
```

## Remapper touches du clavier

Pour remplacer une touche par une autre

```
# On génère le fichier de map 
xmodmap -pke > ~/.Xmodmap
# On trouve la clef a remap 
xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
# On modifie le fichier Xmodmap et on teste avec 
xmodmap ~/.Xmodmap
```

## Trouver le process qui utilise un port

```
sudo netstat -nlp | grep :80
```

## Quand le son se met à foirer

```
pulseaudio -k && sudo alsa force-reload
```
