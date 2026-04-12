#!/usr/bin/env bash

if ! pgrep -x awww-daemon > /dev/null; then
  awww-daemon &
fi

awww img "/home/blasmesian/.config/hypr/wallpapers/cyberpunk_wallpaper_7.png"

for ws in {9..1}; do
    hyprctl dispatch workspace "$ws"
done
