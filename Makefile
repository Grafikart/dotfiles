.PHONY: i3 install xfce

install:
	sudo yay -S - < package.list

i3:
	cd config && stow -t ~ urxvt
	xrdb ~/.Xresources
	cd config && stow -t ~ fish
	cd config && stow -t ~ i3
	cd config && stow -t ~ polybar
	cd config && stow -t ~ compton
	cd config && stow -t ~ easystroke

xfce:
	cd config && stow -t ~ xfce4