#!/usr/bin/env bash

THEME_DIR="$HOME/nixos-dotfiles/dotfiles/wofi"

FLAVOUR="${1:-macchiato}"

STYLE_PATH="$THEME_DIR/src/$FLAVOUR/style.css"
CONFIG_PATH="$THEME_DIR/config"

if [[ ! -f "$STYLE_PATH" ]]; then
    echo "❌ Flavour '$FLAVOUR' not found in $STYLE_PATH"
    exit 1
fi

wofi \
    --conf "$CONFIG_PATH" \
    --style "$STYLE_PATH" \
    --show drun

