var_mainMod = "SUPER"

-- var_fileManager = "thunar"
-- var_fileManager = "nautilus"
var_fileManager = "dolphin"

require("conf.monitor")

-- $fileManager = dolphin

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more

-- Some default env vars.
hl.env("XCURSOR_SIZE", "24")

-- Source a file (multi-file configs)

-- source = ~/.config/hypr/myColors.conf

-- Execute your favorite apps at launch
require("conf.autostart")

-- For KVM virtual machines

-- env = WLR_NO_HARDWARE_CURSORS, 1

-- env = WLR_RENDERER_ALLOW_SOFTWARE, 1

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/
require("conf.input")
require("conf.general")
require("conf.animations")
require("conf.decoration")

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more

-- pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- gestures {

-- # See https://wiki.hyprland.org/Configuring/Variables/ for more

-- workspace_swipe = true

-- }
require("conf.misc")

-- Example per-device config

-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more

-- Example windowrule v1

-- windowrule = float, ^(kitty)$

-- Example windowrule v2

-- windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
require("conf.workspaces")
require("conf.binds")

-- See https://wiki.hyprland.org/Configuring/Variables/ for more

-- disable_hyprland_logo = true

-- disable_splash_rendering = true

-- force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers

-- disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(

-- HyprMod managed settings
require("hyprland-gui")
