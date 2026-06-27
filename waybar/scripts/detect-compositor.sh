#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"
OVERRIDE_FILE="$CONFIG_DIR/compositor-workspaces-module-override.json"

# Detect compositor
if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    MODULE='"hyprland/workspaces"'
elif [ -n "$NIRI_SOCKET" ]; then
    MODULE='"niri/workspaces"'
elif [ -n "$SWAYSOCK" ]; then
    MODULE='"sway/workspaces"'
else
    # Default fallback
    MODULE='"hyprland/workspaces"'
fi

# Write the override file
cat > "$OVERRIDE_FILE" << EOF
{
    "modules-center": [$MODULE]
}
EOF

# Launch waybar with the main config
# waybar -c "$CONFIG_DIR/config.jsonc"
