#!/bin/bash
domain="org.mpris.MediaPlayer2"
path="/org/mpris/MediaPlayer2"
cmd="org.freedesktop.DBus.Properties.Get"

getTitle() {
  artist=$(playerctl metadata artist)
  album=$(playerctl metadata album)
  title=$(playerctl metadata title)

  echo "${*:-%artist% - %title%}" | sed "s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | sed 's/&/\\&/g'
}

isPlaying() {
  status=$(playerctl status)
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