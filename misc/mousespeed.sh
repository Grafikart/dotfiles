#!/bin/bash
# Permet de retirer l'accélération matériel pour ma souris
SEARCH="Razer Razer Taipan"

if [ "$SEARCH" = "" ]; then
    exit 1
fi

ids=$(xinput --list | awk -v search="$SEARCH" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

for i in $ids
do
    xinput set-prop $i 'Device Accel Profile' -1
    xinput set-prop $i 'Device Accel Constant Deceleration' 1
    xinput set-prop $i 'Device Accel Velocity Scaling' 15
done
