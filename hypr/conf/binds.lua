-- ----------------------------#

-- LOCK SCREEN         #

-- ----------------------------#
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

----------------------
--                  --
--     Wallpaper    --
--                  --
----------------------
hl.bind("CTRL  + F1", hl.dsp.exec_cmd("~/.config/rofi/swww-wallpaper.sh"))

-- ----------------------------#

-- SCREENSHOTTING       #

-- ----------------------------#

-- Screenshot: region -> clipboard
hl.bind("Print", hl.dsp.exec_cmd("sh -c 'grim -g \"$(slurp)\" - | wl-copy'"))

-- Screenshot: region -> file
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("sh -c 'mkdir -p ~/Pictures/Screenshots && grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%F_%H-%M-%S).png'"))

-- -------------------------------#

-- notifications         #

-- -------------------------------#
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))

-- ------------------------------#

-- focus             #

-- ------------------------------#

-- Move focus with mainMod + arrow keys
hl.bind(var_mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(var_mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(var_mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(var_mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- ------------------------------#

-- workspaces          #

-- ------------------------------#

-- Switch workspaces with mainMod + [0-9]
hl.bind(var_mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(var_mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(var_mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(var_mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(var_mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(var_mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(var_mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(var_mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(var_mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(var_mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(var_mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(var_mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(var_mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(var_mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(var_mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(var_mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(var_mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(var_mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(var_mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(var_mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(var_mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(var_mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more

-- bind = $mainMod, Q, exec, $terminal
hl.bind(var_mainMod .. " + C", hl.dsp.window.close())

-- bind = $mainMod H, E,exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit
hl.bind(var_mainMod .. " + E", hl.dsp.exec_cmd(var_fileManager))
hl.bind(var_mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- bind = $mainMod, R, exec, $menu
hl.bind(var_mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(var_mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- LANGUAGE FIX
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))

-- ------------------------------#

-- APP LAUNCHER         #

-- ------------------------------#
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -config ~/.config/rofi/app-launcher.rasi -show drun"))

---------------------------
---                     ---
---     STATUS BAR      ---
---                     ---
---------------------------

hl.bind("CTRL + F2", hl.dsp.exec_cmd("pkill -USR1 waybar"))
hl.bind("CTRL + F3", hl.dsp.exec_cmd("$HOME/.config/ThemeManager/WBTP"))
