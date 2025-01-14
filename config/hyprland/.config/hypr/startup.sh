#!/bin/sh
hyprctl dispatch exec [workspace 2 silent] kitty ~/Sites
sleep 1
hyprctl dispatch workspace 3
hyprctl dispatch exec [workspace 3 silent] "flatpak run com.brave.Browser --profile-directory=\"Default\""
sleep 1
hyprctl dispatch workspace 5
hyprctl dispatch exec [workspace 5 silent] flatpak run com.discordapp.Discord
sleep 1
hyprctl dispatch workspace 7
hyprctl dispatch exec [workspace 7 silent] "flatpak run com.brave.Browser --profile-directory=\"Profile 1\""
sleep 1
hyprctl dispatch workspace 1
hyprctl dispatch exec [workspace 1 silent] phpstorm
