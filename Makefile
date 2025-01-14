.PHONY: i3 xfce install installdev installi3

stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list yay --noconfirm --needed -S

installi3: install
	xargs -d '\n' -a packages/i3.list yay --noconfirm --needed -S

installdev: install
	xargs -d '\n' -a packages/dev.list yay --noconfirm --needed -S

dotfiles:
	$(stow) urxvt
	xrdb ~/.Xresources
	$(stow) fish
	$(stow) keyboard
	$(stow) easystroke
	$(stow) rofi
	$(stow) vim
	$(stow) gitnow
	$(stow) bin
	$(stow) mpv
	$(stow) git
	$(stow) brave
	$(stow) zed
	mv ~/gitignore ~/.gitignore

dd:
	$(stow) code

hyprland:
	$(stow) hyprland

i3:
	$(stow) i3
