#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"
CONFIG_FILES="$CONFIG_DIR/config $CONFIG_DIR/style.css"

# Kill existing waybar if running
killall waybar 2>/dev/null

# Start waybar
waybar &

# Watch for changes
while inotifywait -e modify,create,delete $CONFIG_FILES; do
    pkill -SIGUSR2 waybar
done
