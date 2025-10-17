#!/usr/bin/env bash

if ! pgrep -x swww-daemon > /dev/null; then
  swww-daemon &
fi

swww img "/home/blasmesian/.config/hypr/wallpapers/darkroom_hair_fixed.png"

for ws in {9..1}; do
    hyprctl dispatch workspace "$ws"
done
