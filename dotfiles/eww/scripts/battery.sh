#!/usr/bin/env bash

BAT_PATH="/sys/class/power_supply/BAT1"

if [ ! -d "$BAT_PATH" ]; then
  echo '{"percent":0,"status":"Unknown"}'
  exit 0
fi

PERCENT=$(cat "$BAT_PATH/capacity")
STATUS=$(cat "$BAT_PATH/status")

echo "{\"percent\":$PERCENT,\"status\":\"$STATUS\"}"
