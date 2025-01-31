#!/usr/bin/env fish

function restart_waybar
    # Attempt to kill existing waybar processes
    if killall waybar
        hyprctl keyword general:gaps_out 0
        hyprctl keyword general:gaps_in 0
        hyprctl keyword general:border_size 0
        hyprctl keyword animations:enabled false
    else
        hyprctl keyword general:gaps_out 4
        hyprctl keyword general:gaps_in 4
        hyprctl keyword general:border_size 2
        hyprctl keyword animations:enabled true
        waybar &
    end
end

# Run the function
restart_waybar
