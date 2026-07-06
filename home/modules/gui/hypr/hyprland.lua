--###############
--## MONITORS ###
--###############
hl.monitor({
    output = "eDP-1",
    mode = "2880x1920@120.0",
    position = "0x0",
    scale = "1.33",
})

hl.monitor({
    output = "DP-3",
    mode = "1920x1080@60.00",
    position = "2496x192",
    scale = "1",
})

hl.monitor({
    output = "DP-1",
    mode = "3840x2160@30.00",
    position = "2176x32",
    scale = "2",
})

-- monitor=HDMI-A-1, preferred, auto, 1, mirror, eDP-1

hl.env("QT_QPA_PLATFORM", "wayland")
-- env = QT_QPA_PLATFORMTHEME,QT_QPA_PLATFORM,Catppuccin-Mocha-Standard-Teal-Dark
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

local terminal = "ghostty"
local fileManager = "nautilus"
local menu = "wofi -S run"
local mail = "mailspring --password-store=\"gnome-libsecret\""
local resizeSpd = "10%"
local mainMonitor = "eDP-1"
local IDE = "neovide"
local browser = "firefox"
local discord = "vesktop"
local restartAshell = "\"pkill ashell ; ashell\""
local taskManager = "kitty -e btop"
local notes = "obsidian"
local wallpapers = "waypaper"

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- TODO: manual review — plugin section ''. The new Lua API exposes plugins via hl.plugin.<name>(...) — wire up per the plugin's docs.
--[[
  -- hyprfoci {
  -- 	# can be from -1 to 1, will be
  -- 		# dynamic ratio with the window instead.
  -- 		# recommend fixed size for image as dynamic can look weird
  -- 		# leave one as 0 to keep original image ratio (image only)
  -- 	# width, height
  -- 	size = 0, 0.07
  --
  -- 	# shift down right (can be from -1 to 1, similarly)
  -- 	pos = 0, 0
  --
  -- 	#0: left/top, 1: middle, 2: down/right
  -- 	origin = 1.4, -0.11
  --
  --        # path to a directory with both.png, left.png, right.png
  -- 	# Absolute path is needed (~ for home directory is fine)
  -- 	imgs = /home/etanheinmik/Projects/hypr_plugins/Hyprfoci/bongo
  --  }
]]

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})
hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})
hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.window_rule({
    match = {
        class = "^(yad)$",
    },
    float = true,
    pin = true,
    stay_focused = true,
})

hl.window_rule({
    match = {
        class = "org-eclipse-core-internal-jobs-Worker",
    },
    stay_focused = true,
})

hl.window_rule({
    match = {
        title = "^(menu window)$",
        class = "^(zoom)$",
    },
    stay_focused = true,
})

hl.window_rule({
    match = {
        title = "^(confirm window)$",
        class = "^(zoom)$",
    },
    stay_focused = true,
})

hl.window_rule({
    match = {
        title = "^(Send chat to…)$",
        class = "^(zoom)$",
    },
    stay_focused = true,
})

hl.window_rule({
    match = {
        title = "^(move window)$",
        class = "^(zoom)$",
    },
    stay_focused = true,
    move = "onscreen cursor",
})

hl.window_rule({
    match = {
        title = "^(Send chat to…)$",
        class = "^(zoom)$",
    },
    move = "onscreen cursor",
})

hl.window_rule({
    match = {
        title = "^(menu window)$",
        class = "^(zoom)$",
    },
    move = "onscreen cursor",
})

hl.window_rule({
    match = {
        title = "^(confirm window)$",
        class = "^(zoom)$",
    },
    move = "onscreen cursor",
})

hl.window_rule({
    match = {
        float = true,
    },
    opacity = "1.0 override 1.0 override",
})

hl.window_rule({
    match = {
        class = "waypaper",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
})

-- TODO: manual review — top-level key 'suppress_event = maximize' has no enclosing section
hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
    },
    no_focus = true,
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + N", hl.dsp.exec_raw(IDE))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(taskManager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpapers))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("loginctl lock-session"))

hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.pin())
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.cycle_next({ next = true }))

hl.bind("F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_raw(menu))
hl.bind("ALT + SPACE", hl.dsp.exec_raw(menu))
hl.bind(mainMod .. " + M", hl.dsp.exec_raw(mail))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("loginctl lock-session ; sudo systemctl hibernate"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mainMod .. " + CTRL + v", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + v", hl.dsp.layout("togglesplit"))
hl.bind("CTRL + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "d" }))

-- TODO: manual review on line 360 — resizeactive: could not parse pixel coords "-$resizeSpd 0"
-- hl.bind(mainMod .. " + CTRL + h", hl.dsp.resizeactive("-" .. resizeSpd .. " 0"))
-- TODO: manual review on line 361 — resizeactive: could not parse pixel coords "$resizeSpd 0"
-- hl.bind(mainMod .. " + CTRL + l", hl.dsp.resizeactive(resizeSpd .. " 0"))
-- TODO: manual review on line 362 — resizeactive: could not parse pixel coords "0 -$resizeSpd"
-- hl.bind(mainMod .. " + CTRL + k", hl.dsp.resizeactive("0 -" .. resizeSpd))
-- TODO: manual review on line 363 — resizeactive: could not parse pixel coords "0 $resizeSpd"
-- hl.bind(mainMod .. " + CTRL + j", hl.dsp.resizeactive("0 " .. resizeSpd))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + o", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + i", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + o", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + i", hl.dsp.focus({ workspace = -1 }))
hl.bind(mainMod .. " + SHIFT + o", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + i", hl.dsp.window.move({ workspace = -1 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + CTRL + 1", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "1" }))
hl.bind(mainMod .. " + CTRL + 2", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "2" }))
hl.bind(mainMod .. " + CTRL + 3", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "3" }))
hl.bind(mainMod .. " + CTRL + 4", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "4" }))
hl.bind(mainMod .. " + CTRL + 5", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "5" }))
hl.bind(mainMod .. " + CTRL + 6", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "6" }))
hl.bind(mainMod .. " + CTRL + 7", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "7" }))
hl.bind(mainMod .. " + CTRL + 8", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "8" }))
hl.bind(mainMod .. " + CTRL + 9", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "9" }))
hl.bind(mainMod .. " + CTRL + 0", hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "10" }))

hl.bind(mainMod .. " + x", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + x", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.config({
    debug = {
        disable_logs = false,
    },
    xwayland = {
        use_nearest_neighbor = false,
    },
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 3,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = { colors = { "rgba(fab387ee)", "rgba(86b1e3ee)" }, angle = 30 },
            inactive_border = "rgba(595959aa)",
        },
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
        rounding = 10,
        rounding_power = 2,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 10,
            render_power = 5,
            color = "rgba(1a1a1aee)",
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.2696,
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
        enabled = true,
        -- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    },
    dwindle = {
        -- pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- You probably want this
    },
    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
        new_status = "master",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
    --############
    --## INPUT ###
    --############
    -- https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("\"sudo systemctl start iwd\"")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("\"waybar\"")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("\"syshud\"")
    hl.exec_cmd("\"hyprpaper\"")
    hl.exec_cmd("\"systemctl enable --now auto-cpufreq\"")
    hl.exec_cmd("\"battery_monitor.sh\"")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("dbus-update-activation-environment --systemd GNOME_KEYRING_CONTROL")
end)

