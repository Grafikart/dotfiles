#!/usr/bin/env sh

action=$1
direction=$2

# Move focus that handle groups https://github.com/hyprwm/Hyprland/issues/1087

if [[ -z $1 ]]; then 
  echo "please specify modes move or switch and direction l or r"
  exit 1
fi 

data=$(hyprctl activewindow -j)
groupSize=$(echo "$data" | jq -r '.grouped | length')
address=$(echo "$data" | jq -r '.address')
groupIndex=$(echo $data | jq --arg address "$address" -r '.grouped | index($address)')

if [[ $action == "move" ]]; then 
  command_group=movegroupwindow
  command_window=movewindoworgroup
elif [[ $action == "switch" ]]; then
  command_group=changegroupactive
  command_window=movefocus
fi 

if [[ $direction == "l" || $direction == "left" ]]; then
  param_group=b 
  param_window=l 
elif [[ $direction == "r" || $direction == "right" ]]; then
  param_group=f 
  param_window=r
fi 

if [[ $(( $groupIndex + 1 )) = $groupSize && $param_window = r ]] || [[ $(( $groupIndex + 1 )) = 1 && $param_window = l ]] || [[ $groupSize = 0 ]]; then
  arguments="$command_window $param_window"
else
  arguments="$command_group $param_group"
fi

hyprctl dispatch $arguments