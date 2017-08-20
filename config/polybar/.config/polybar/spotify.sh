#!/bin/bash
domain="org.mpris.MediaPlayer2"
path="/org/mpris/MediaPlayer2"
cmd="org.freedesktop.DBus.Properties.Get"

getTitle() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  meta=$(dbus-send --print-reply --dest=${domain}.spotify ${path} ${cmd} string:${domain}.Player string:Metadata)
  
  artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1)
  album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)
  title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)

  echo "${*:-%artist% - %title%}" | sed "s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | sed 's/&/\\&/g'
}

isPlaying() {
  status=$(dbus-send --print-reply --dest=${domain}.spotify ${path} ${cmd} string:${domain}.Player string:PlaybackStatus \
    | tail -1 \
    | sed 's/^.*"\(.*\)".*/\1/')
  if [ "${status}" = "Paused" ]; then
    exit 1
  fi
  echo $status; exit
}

togglePlay() {
  dbus-send --print-reply --dest=${domain}.spotify ${path} ${domain}.Player.PlayPause
}

case "$1" in
        --title)
                getTitle
        ;;
        --togglePlay)
                togglePlay
        ;;
        --isPlaying)
                isPlaying
        ;;
esac