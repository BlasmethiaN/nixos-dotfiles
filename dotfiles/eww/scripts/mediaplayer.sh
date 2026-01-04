#!/usr/bin/env bash

get_media() {
    status=$(playerctl status 2>/dev/null)
    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
        playerctl metadata --format '{{ artist }} - {{ title }}'
    else
        echo ""
    fi
}

get_media

playerctl metadata --follow --format '{{ artist }} - {{ title }}' 2>/dev/null | while read -r line; do
    get_media
done
