#!/bin/sh
# Display and rendering
i3-msg "exec --no-startup-id nvidia-settings --load-config-only";
i3-msg "exec --no-startup-id picom";
# Remove blue light when it's dark
i3-msg "exec --no-startup-id redshift -l 43.610769:3.876716 -t 6500:3500 -l manual";
i3-msg "exec --no-startup-id nm-applet --sm-disable";
i3-msg "exec --no-startup-id nm-applet --sm-disable";
# Pamac Manager a besoin de ça pour gérer l'authentification
i3-msg "exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1";

# Keyboard (disable caps lock and replace `
xmodmap ~/.Xmodmap
i3-msg "exec --no-startup-id setxkbmap -option caps:none";

# Prepare workspaces
i3-msg "workspace 2; exec --no-startup-id kitty -d ~/Sites";
sleep 2;
i3-msg "workspace 5; exec --no-startup-id flatpak run com.brave.Browser --profile-directory=\"Default\"; exec --no-startup-id flatpak run com.discordapp.Discord";
i3-msg "workspace 5; exec --no-startup-id flatpak run com.discordapp.Discord";
sleep 2;
i3-msg "workspace 8; exec --no-startup-id flatpak run com.brave.Browser --profile-directory=\"Profile 2\"";
sleep 2;
i3-msg "workspace 7; exec --no-startup-id flatpak run com.brave.Browser --profile-directory=\"Profile 1\"";
