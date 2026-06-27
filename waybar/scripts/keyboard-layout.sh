#!/usr/bin/env sh

# Configuration
PERSIAN_PATTERNS="persian|iran|fa"
ENGLISH_PATTERNS="english|us|en"

# Helper function to parse layout string
parse_layout() {
    echo "$1" | awk '{print tolower($0)}' | \
    awk -v persian="$PERSIAN_PATTERNS" -v english="$ENGLISH_PATTERNS" '
    $0 ~ persian {print "fa"; exit}
    $0 ~ english {print "us"; exit}
    {print "us"}
    '
}

# WM-specific layout getters
get_hyprland_layout() {
    layout=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap' 2>/dev/null | head -1)
    parse_layout "${layout:-us}"
}

get_sway_layout() {
    layout=$(swaymsg -t get_inputs 2>/dev/null | jq -r '.[] | select(.type == "keyboard") | .xkb_active_layout_name' | head -1)
    parse_layout "${layout:-us}"
}

get_niri_layout() {
    layout=$(niri msg -j keyboard-layouts 2>/dev/null | jq -r '.[0].name' 2>/dev/null)
    parse_layout "${layout:-us}"
}

get_fallback_layout() {
    layout=$(localectl status 2>/dev/null | awk -F': ' '/X11 Layout/ {print $2; exit}')
    parse_layout "${layout:-us}"
}

# Main detection logic
main() {
    if pgrep -x "Hyprland" > /dev/null 2>&1; then
        get_hyprland_layout
    elif pgrep -x "sway" > /dev/null 2>&1; then
        get_sway_layout
    elif pgrep -x "niri" > /dev/null 2>&1; then
        get_niri_layout
    else
        get_fallback_layout
    fi
}

main
