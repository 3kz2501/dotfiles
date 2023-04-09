#!/bin/bash

#st_prev=$(cat /sys/class/drm/card0-HDMI-A-1/status)
st_prev="disconnected"

while :
do
    st_next=$(cat /sys/class/drm/card0-HDMI-A-1/status)
    if [ $st_prev != $st_next ]; then
        st_prev=$st_next
        if [ $st_next = "connected" ]; then
            xrandr --output eDP-1 --auto --output HDMI-1-0 --auto --same-as eDP-1
        else
            xrandr --output HDMI-1-0 --off --output eDP-1 --auto
        fi
        ~/.fehbg
    fi
    sleep 1
done
