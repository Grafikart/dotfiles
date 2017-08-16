#!/bin/bash

rm -rf ~/.config/i3
ln -s $(readlink -f config/i3) ~/.config/i3

rm -rf ~/.config/polybar
ln -s $(readlink -f config/polybar) ~/.config/polybar

rm -f ~/.Xresources
ln -s $(readlink -f .Xresources) ~/.Xresources

rm -f ~/.config/compton.conf
ln -s $(readlink -f config/compton.conf) ~/.config/compton.conf