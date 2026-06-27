-- STATUS BAR      #
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/waybar/scripts/detect-compositor.sh")
    hl.exec_cmd("copyq --start-server")
--    hl.exec_cmd("waybar")
    hl.exec_cmd("~/.config/waybar/waybar-auto-reload.sh")
    hl.exec_cmd("swaync")
end)

-- Settings App
hl.on("hyprland.start", function()
    hl.exec_cmd("~/.config/com.ml4w.hyprlandsettings/hyprctl.sh")
end)

-- WALLPAPER      #

-- exec-once = waypaper --restore
hl.on("hyprland.start", function()
    -- hl.exec_cmd("hyprpaper -c ~/.config/hypr/hyprpaper.conf")
    hl.exec_cmd("systemctl --user start swww-daemon.service")
    hl.exec_cmd("swww img ~/.config/wallpapers/Pictures/Anime/Anime-Night-Girl.jpg -o eDP-1 --transition-type wipe --transition-duration 2 --transition-fps 60")
end)

-- exec-once = hyprlock

-- exec-once = mpvpaper -o "loop" eDP-1 ~/.config/wallpapers/Videos/Acheron\ Black\ Hole\ 16:10.mp4:
