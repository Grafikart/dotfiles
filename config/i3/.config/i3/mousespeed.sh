#!/bin/sh
for id in `xinput --list | grep 'Taipan' | perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; do
    echo "setting device ID $id"
    xinput set-prop $id "Device Accel Velocity Scaling" 1
    xinput set-prop $id "libinput Accel Speed" -0.50
    xinput set-prop $id "Device Accel Constant Deceleration" 3
done 