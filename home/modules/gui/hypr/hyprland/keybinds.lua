-- App launchers
hl.bind(mainMod .. " + D",          hl.dsp.exec_cmd(discord))
hl.bind(mainMod .. " + N",          hl.dsp.exec_raw(IDE))
hl.bind(mainMod .. " + B",          hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + B",  hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mainMod .. " + P",          hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T",          hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + Q",          hl.dsp.exec_cmd(taskManager))
hl.bind(mainMod .. " + W",          hl.dsp.exec_cmd(wallpapers))
hl.bind(mainMod .. " + M",          hl.dsp.exec_raw(mail))
hl.bind(mainMod .. " + SPACE",      hl.dsp.exec_raw(menu))
hl.bind("ALT + SPACE",              hl.dsp.exec_raw(menu))

-- System
hl.bind(mainMod .. " + C",          hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + M",   hl.dsp.exit())
hl.bind(mainMod .. " + ALT + L",    hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + CTRL + P",   hl.dsp.exec_cmd("loginctl lock-session ; sudo systemctl hibernate"))
hl.bind(mainMod .. " + SHIFT + P",  hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mainMod .. " + SHIFT + T",  hl.dsp.exec_cmd("theme-toggle"))

-- Window management
hl.bind(mainMod .. " + F",          hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",          hl.dsp.window.pin())
hl.bind(mainMod .. " + CTRL + F",   hl.dsp.window.cycle_next({ next = true }))
hl.bind("F11",                      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + CTRL + v",   hl.dsp.window.pseudo())
hl.bind(mainMod .. " + v",          hl.dsp.layout("togglesplit"))

-- Screenshots
hl.bind("CTRL + SHIFT + PRINT",     hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("CTRL + PRINT",             hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT",                    hl.dsp.exec_cmd("hyprshot -m region"))

-- Focus (vim motions)
hl.bind(mainMod .. " + h",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l",          hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",          hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",          hl.dsp.focus({ direction = "down" }))

-- Move windows (vim motions)
hl.bind(mainMod .. " + SHIFT + h",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l",  hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k",  hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j",  hl.dsp.window.move({ direction = "d" }))

-- Resize windows (vim motions) — use pixel step, not percentage string
hl.bind(mainMod .. " + CTRL + h",   hl.dsp.window.resize({x = -resizeSpd, y = 0, relative = true}))
hl.bind(mainMod .. " + CTRL + l",   hl.dsp.window.resize({x = resizeSpd, y = 0, relative = true}))
hl.bind(mainMod .. " + CTRL + k",   hl.dsp.window.resize({x = 0, y = -resizeSpd, relative = true}))
hl.bind(mainMod .. " + CTRL + j",   hl.dsp.window.resize({x = 0, y = resizeSpd, relative = true}))

-- Workspace switching
hl.bind(mainMod .. " + 1",          hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2",          hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3",          hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4",          hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5",          hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6",          hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7",          hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8",          hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9",          hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0",          hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + o",          hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + i",          hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + o",   hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + CTRL + i",   hl.dsp.focus({ workspace = -1 }))

-- Move window to workspace
hl.bind(mainMod .. " + SHIFT + 1",  hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2",  hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3",  hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4",  hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5",  hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6",  hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7",  hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8",  hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9",  hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0",  hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + o",  hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + i",  hl.dsp.window.move({ workspace = -1 }))

-- Move workspace to monitor
hl.bind(mainMod .. " + CTRL + 1",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "1" }))
hl.bind(mainMod .. " + CTRL + 2",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "2" }))
hl.bind(mainMod .. " + CTRL + 3",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "3" }))
hl.bind(mainMod .. " + CTRL + 4",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "4" }))
hl.bind(mainMod .. " + CTRL + 5",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "5" }))
hl.bind(mainMod .. " + CTRL + 6",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "6" }))
hl.bind(mainMod .. " + CTRL + 7",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "7" }))
hl.bind(mainMod .. " + CTRL + 8",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "8" }))
hl.bind(mainMod .. " + CTRL + 9",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "9" }))
hl.bind(mainMod .. " + CTRL + 0",   hl.dsp.workspace.move({ workspace = mainMonitor, monitor = "10" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + x",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + x",  hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse window drag / resize
hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize())

-- Media / volume
hl.bind("XF86AudioRaiseVolume",     hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",     hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),         { locked = true, repeating = true })
hl.bind("XF86AudioMute",            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),        { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),      { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",      hl.dsp.exec_cmd("brightnessctl s 5%+"),                               { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",    hl.dsp.exec_cmd("brightnessctl s 5%-"),                               { locked = true, repeating = true })
hl.bind("XF86AudioNext",            hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause",           hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",            hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",            hl.dsp.exec_cmd("playerctl previous"),    { locked = true })
