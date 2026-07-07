-- Shared variables — globals so sub-modules can reference them without imports
terminal     = "ghostty"
fileManager  = "nautilus"
menu         = "wofi -S run"
mail         = "mailspring --password-store=\"gnome-libsecret\""
mainMonitor  = "eDP-1"
IDE          = "neovide"
browser      = "firefox"
discord      = "vesktop"
taskManager  = "kitty -e btop"
notes        = "obsidian"
wallpapers   = "waypaper"
mainMod      = "SUPER"
resizeSpd    = 50  -- pixels; percentage strings ("-10% 0") are not supported by hl.dsp.resizeactive

local cfg = os.getenv("HOME") .. "/.config/hypr/hyprland/"
dofile(cfg .. "monitors.lua")
dofile(cfg .. "env.lua")
dofile(cfg .. "animations.lua")
dofile(cfg .. "window_rules.lua")
dofile(cfg .. "config.lua")
dofile(cfg .. "keybinds.lua")
dofile(cfg .. "startup.lua")
