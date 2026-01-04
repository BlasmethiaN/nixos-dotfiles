#!/usr/bin/env bash

if [ "$1" == "up" ]; then
    wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
elif [ "$1" == "down" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
fi

eww update vol_reveal=true

ID_FILE="/tmp/eww_vol_id"
echo $$ > "$ID_FILE"

sleep 1.5

if [ "$(cat "$ID_FILE")" == "$$" ]; then
    eww update vol_reveal=false
fi
