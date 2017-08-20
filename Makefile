.PHONY: i3 xfce install installdev installi3

install:
	xargs -d '\n' -a packages/package.list yay --noconfirm -S

installi3: install
	xargs -d '\n' -a packages/i3.list yay --noconfirm -S

installdev: install
	xargs -d '\n' -a packages/dev.list yay --noconfirm -S

i3:
	cd config && stow -v -t ~ urxvt
	xrdb ~/.Xresources
	cd config && stow -v -t ~ fish
	cd config && stow -v -t ~ i3
	cd config && stow -v -t ~ polybar
	cd config && stow -v -t ~ compton
	cd config && stow -v -t ~ keyboard
	cd config && stow -v -t ~ easystroke

xfce:
	cd config && stow -v -t ~ xfce4
