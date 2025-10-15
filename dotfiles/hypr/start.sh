#!/usr/bin/env bash

if ! pgrep -x swww-daemon > /dev/null; then
  swww-daemon &
  sleep 1
fi

swww img "/home/blasmesian/.config/hypr/wallpapers/darling.png"

