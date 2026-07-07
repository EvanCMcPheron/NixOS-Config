hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

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
        col = {
            active_border = { colors = { "rgba(fab387ee)", "rgba(86b1e3ee)" }, angle = 30 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 10,
            render_power = 5,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.2696,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0.3,
        touchpad = {
            natural_scroll = true,
        },
    },
})
