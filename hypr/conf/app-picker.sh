#!/bin/sh
mode="$1"

run_menu() {
  rofi -config ~/.config/rofi/app-launcher.rasi -dmenu -i -p "$1"
}

case "$mode" in
  terminals)
    choice=$(printf "ghostty\nkitty\nalacritty\nwezterm\nkonsole\ntabby" | run_menu "Terminal")
    ;;
  browser)
        choice=$(printf "firefox\nfirefox-developer-edition\nchromium\nbrave\nfalkon\nopera\ngoogle-chrome-stable" | run_menu "Browser")
    ;;
  media)
    choice=$(printf "vlc" | run_menu "Media")
    ;;
  *)
    exit 1
    ;;
esac

[ -n "$choice" ] && hyprctl dispatch exec "$choice"
