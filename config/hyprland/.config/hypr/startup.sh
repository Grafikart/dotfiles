#!/bin/sh
hyprctl dispatch exec [workspace 2 silent] kitty ~/Sites
# hyprctl dispatch workspace 3
# hyprctl dispatch exec [workspace 3] "flatpak run com.brave.Browser --profile-directory=\"Default\""
# sleep 1
# hyprctl dispatch workspace 7
# hyprctl dispatch exec [workspace 7] "flatpak run com.brave.Browser --profile-directory=\"Profile 1\""
#sleep 1
#hyprctl dispatch workspace 1
#hyprctl dispatch exec [workspace 1] phpstorm
sleep 1
hyprctl dispatch workspace 5
hyprctl dispatch exec [workspace 5] flatpak run com.discordapp.Discord
