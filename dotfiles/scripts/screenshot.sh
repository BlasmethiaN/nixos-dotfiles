#!/usr/bin/env bash

SCRSHOT_FILE="/tmp/screenshot-$(date +%s).png"

case "$1" in
    "select")
        grim -g "$(slurp)" "$SCRSHOT_FILE"
        ;;
    "full")
        grim "$SCRSHOT_FILE"
        ;;
    *)
        echo "Použití: $0 {select|full}"
        exit 1
        ;;
esac

if [ -f "$SCRSHOT_FILE" ]; then
    wl-copy < "$SCRSHOT_FILE"

    notify-send "📷 Screenshot" "The screenshot has been saved to the clipboard."
else
    notify-send "Screenshot cancelled"
fi
