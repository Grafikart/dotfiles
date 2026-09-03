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
  command_group=move_group
  command_window=move_window
elif [[ $action == "switch" ]]; then
  command_group=switch_group
  command_window=focus_window
fi 

if [[ $direction == "l" || $direction == "left" ]]; then
  param_group=b 
  param_window=l 
  dispatch_direction=left
elif [[ $direction == "r" || $direction == "right" ]]; then
  param_group=f 
  param_window=r
  dispatch_direction=right
fi 

if [[ $(( $groupIndex + 1 )) = $groupSize && $param_window = r ]] || [[ $(( $groupIndex + 1 )) = 1 && $param_window = l ]] || [[ $groupSize = 0 ]]; then
  if [[ $command_window == move_window ]]; then
    arguments="hl.dsp.window.move({ direction = \"$dispatch_direction\", group_aware = true })"
  else
    arguments="hl.dsp.focus({ direction = \"$dispatch_direction\" })"
  fi
else
  if [[ $command_group == move_group ]]; then
    if [[ $param_group == f ]]; then
      arguments='hl.dsp.group.move_window({ forward = true })'
    else
      arguments='hl.dsp.group.move_window({ forward = false })'
    fi
  elif [[ $param_group == f ]]; then
    arguments='hl.dsp.group.next()'
  else
    arguments='hl.dsp.group.prev()'
  fi
fi

hyprctl dispatch "$arguments"
