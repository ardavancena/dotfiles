set -euo pipefail

tmpfile="$(mktemp)"
trap 'rm -f "$tmpfile"' EXIT

# Ensure Wi-Fi is enabled
nmcli radio wifi on >/dev/null 2>&1 || true

# Start fetching networks in background
(
    nmcli dev wifi rescan >/dev/null 2>&1 || true
    nmcli -t -f ACTIVE,SSID,SECURITY,SIGNAL dev wifi list | awk -F: '!seen[$2]++' >"$tmpfile"
) &

bg_pid=$!

# Placeholder
echo "Searching for networks..." | rofi -config ~/.config/rofi/wifi.rasi -dmenu -p "Wi-Fi" -lines 1 -width 600 -no-custom &
rofi_pid=$!

# Wait for scan to finish
wait "$bg_pid" || true

# Close placeholder rofi if it's still open
kill "$rofi_pid" 2>/dev/null || true
wait "$rofi_pid" 2>/dev/null || true

# Build final menu
chosen=$(awk -F: '{
    active = ($1 == "yes") ? "" : " ";
    ssid = $2;
    sec = ($3 == "") ? "open" : $3;
    sig = $4;
    printf "%s  %s  [%s]  %s%%\n", active, ssid, sec, sig
}' "$tmpfile" | rofi -config ~/.config/rofi/wifi.rasi -dmenu -p "Wi-Fi" -lines 15 -width 600 -i)

# Exit if nothing selected
[ -z "${chosen:-}" ] && exit 0

# Ignore placeholder just in case
[ "$chosen" = "Searching for networks..." ] && exit 0

# Extract SSID from displayed line
ssid=$(echo "$chosen" | sed 's/^.\s\s//' | sed 's/\s\s\[[^]]*\]\s\s[0-9]*%$//')

# Check if connection already exists
if nmcli -t -f NAME connection show | grep -Fxq "$ssid"; then
    nmcli connection up "$ssid"
else
    password=$(rofi -config ~/.config/rofi/wifi.rasi -dmenu -p "Password for $ssid" -password -width 500)
    [ -z "${password:-}" ] && exit 0
    nmcli dev wifi connect "$ssid" password "$password"
fi
