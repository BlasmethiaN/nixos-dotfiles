#!/usr/bin/env bash

layout_index=""
in_block=""

hyprctl devices | while read -r line; do
    # Začátek bloku klávesnice
    if [[ $line == *"Keyboard at "* ]]; then
        layout_index=""
        in_block="yes"
    fi

    # Uložíme layout index
    if [[ "$in_block" == "yes" && "$line" == *"active layout index:"* ]]; then
        layout_index=$(echo "$line" | awk '{print $NF}')
    fi

    # Pokud v bloku najdeme main: yes, vypíšeme layout_index a končíme
    if [[ "$in_block" == "yes" && "$line" == *"main: yes"* ]]; then
        case "$layout_index" in
            0) echo "🇺🇸 US" ;;
            1) echo "🇨🇿 CZ" ;;
            *) echo "?? ($layout_index)" ;;
        esac
        exit 0
    fi
done

# Pokud nic nenalezeno
echo "?? (not found)"
