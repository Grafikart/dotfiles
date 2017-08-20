.PHONY: i3 install xfce

install:
	xargs -d '\n' -a package.list yay --noconfirm -S

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
