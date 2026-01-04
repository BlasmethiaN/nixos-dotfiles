#!/usr/bin/env bash

if ! pgrep -x swww-daemon > /dev/null; then
  swww-daemon &
fi

swww img "/home/blasmesian/.config/hypr/wallpapers/cyberpunk_wallpaper_7.png"

for ws in {9..1}; do
    hyprctl dispatch workspace "$ws"
done
