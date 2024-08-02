#!/bin/sh

pid=$(hyprctl activewindow -j | jq '.pid')
ppid=$(pgrep --newest --parent "$pid")
dir=$(readlink /proc/"$ppid"/cwd || echo "$HOME")
[ -d "$dir" ] && echo "$dir" || echo "$HOME"
