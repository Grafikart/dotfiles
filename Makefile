.PHONY: i3 xfce install installdev installi3

stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list yay --noconfirm --needed -S

installi3: install
	xargs -d '\n' -a packages/i3.list yay --noconfirm --needed -S

installdev: install
	xargs -d '\n' -a packages/dev.list yay --noconfirm --needed -S

i3:
	$(stow) urxvt
	xrdb ~/.Xresources
	$(stow) fish
	$(stow) i3
	$(stow) polybar
	$(stow) picom
	$(stow) keyboard
	$(stow) easystroke
	$(stow) dunst
	# $(stow) rofi
	$(stow) vim
	$(stow) gitnow
	$(stow) bin
	$(stow) mpv

xfce:
	$(stow) xfce4
