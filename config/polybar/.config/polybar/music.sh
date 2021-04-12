#!/bin/bash
domain="org.mpris.MediaPlayer2"
path="/org/mpris/MediaPlayer2"
cmd="org.freedesktop.DBus.Properties.Get"

getTitle() {
  playerctl metadata --format "{{ artist }} - {{ title }}"
}

isPlaying() {
  status=$(playerctl metadata --format '{{status}}')
  if [ "${status}" = "Playing" ]; then
    echo $status; exit
  fi
  exit 1
}

togglePlay() {
  playerctl play-pause
}

case "$1" in
        --title)
                getTitle
        ;;
        --isPlaying)
                isPlaying
        ;;
esac
