#!/usr/bin/env bash

# Universal workspaces script for Sway, Hyprland, and Niri

# Function to detect which compositor is actually running
detect_compositor() {
    if pgrep -x "Hyprland" > /dev/null; then
        echo "hyprland"
    elif pgrep -x "sway" > /dev/null; then
        echo "sway"
    elif pgrep -x "niri" > /dev/null; then
        echo "niri"
    else
        echo "unknown"
    fi
}

# Get workspaces for Hyprland
get_hyprland() {
    if ! command -v hyprctl > /dev/null; then
        echo '{"text":"❌","tooltip":"hyprctl not found"}'
        return 1
    fi
    
    local workspaces=$(hyprctl workspaces -j 2>/dev/null)
    local active=$(hyprctl activeworkspace -j 2>/dev/null)
    
    if [ -z "$workspaces" ] || [ -z "$active" ]; then
        echo '{"text":"⚠️","tooltip":"Hyprland IPC error"}'
        return 1
    fi
    
    local active_id=$(echo "$active" | jq '.id')
    
    # Build workspace display
    local display=""
    local tooltip=""
    
    echo "$workspaces" | jq -r --argjson active_id "$active_id" 'sort_by(.id) | .[] | "\(.id):\(.name):\(.id == $active_id)"' | while IFS=':' read -r id name focused; do
        if [ "$focused" = "true" ]; then
            display+="[$name] "
            tooltip+="→ $name (active)\n"
        else
            display+="$name "
            tooltip+="  $name\n"
        fi
    done
    
    # Remove trailing space
    display=$(echo "$display" | sed 's/ $//')
    tooltip=$(echo -e "$tooltip" | sed 's/\n$//')
    
    echo "{\"text\":\"$display\", \"tooltip\":\"$tooltip\"}"
}

# Get workspaces for Sway
get_sway() {
    if ! command -v swaymsg > /dev/null; then
        echo '{"text":"❌","tooltip":"swaymsg not found"}'
        return 1
    fi
    
    local workspaces=$(swaymsg -t get_workspaces 2>/dev/null)
    
    if [ -z "$workspaces" ]; then
        echo '{"text":"⚠️","tooltip":"Sway IPC error"}'
        return 1
    fi
    
    local display=""
    local tooltip=""
    
    echo "$workspaces" | jq -r 'sort_by(.num) | .[] | "\(.num):\(.name):\(.focused)"' | while IFS=':' read -r num name focused; do
        if [ "$focused" = "true" ]; then
            display+="[$name] "
            tooltip+="→ $name (active)\n"
        else
            display+="$name "
            tooltip+="  $name\n"
        fi
    done
    
    display=$(echo "$display" | sed 's/ $//')
    tooltip=$(echo -e "$tooltip" | sed 's/\n$//')
    
    echo "{\"text\":\"$display\", \"tooltip\":\"$tooltip\"}"
}

# Get workspaces for Niri
get_niri() {
    if ! command -v niri > /dev/null; then
        echo '{"text":"❌","tooltip":"niri command not found"}'
        return 1
    fi
    
    # Try to get workspace info from niri
    # Note: Niri's IPC is still evolving, this is a basic implementation
    local workspaces=$(niri msg workspaces 2>/dev/null)
    
    if [ -z "$workspaces" ]; then
        echo '{"text":"📺","tooltip":"Niri running - workspace API limited"}'
        return 0
    fi
    
    # Parse niri output (format may vary by version)
    # This is a simplified version - you may need to adjust based on your niri version
    local display=""
    local tooltip="Niri Workspaces\n"
    
    # Try to extract workspace names if possible
    if echo "$workspaces" | grep -q "Workspace"; then
        echo "$workspaces" | while read -r line; do
            if [[ $line =~ \"([^\"]+)\" ]]; then
                local ws_name="${BASH_REMATCH[1]}"
                if [[ $line == *"*"* ]]; then
                    display+="[$ws_name] "
                    tooltip+="→ $ws_name (active)\n"
                else
                    display+="$ws_name "
                    tooltip+="  $ws_name\n"
                fi
            fi
        done
        display=$(echo "$display" | sed 's/ $//')
        echo "{\"text\":\"$display\", \"tooltip\":\"$tooltip\"}"
    else
        # Fallback for niri without detailed workspace info
        echo '{"text":"📺","tooltip":"Niri: Use niri/workspaces module for full functionality"}'
    fi
}

# Main execution
COMPOSITOR=$(detect_compositor)

case "$COMPOSITOR" in
    hyprland)
        get_hyprland
        ;;
    sway)
        get_sway
        ;;
    niri)
        get_niri
        ;;
    *)
        echo '{"text":"❓","tooltip":"No supported WM detected (Sway/Hyprland/Niri)"}'
        ;;
esac
