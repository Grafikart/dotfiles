-- Hyprland 0.55+ configuration entry point.
-- Each module maps to a former .conf include. Hyprland isolates `require()`d
-- files, so an error in one module does not prevent the others from loading.
require("monitors")
require("theme")
require("windowrules")
require("animations")
require("keybindings")

hl.on("hyprland.start", function()
    -- exec-once = nm-applet &
    hl.exec_cmd("waybar")
    hl.exec_cmd("wlsunset -l 48.8666 -L 2.33")
    hl.exec_cmd("hyprpaper")
    -- Auth
    -- exec-once = gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
    -- exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
    -- exec-once = systemctl --user start hyprpolkitagent
    -- Screen sharing : https://gist.github.com/brunoanc/2dea6ddf6974ba4e5d26c3139ffb7580#install-pipewire-and-friends
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    -- Prepare everything
    hl.exec_cmd("~/.config/hypr/startup.sh")
end)

-- See https://wiki.hyprland.org/Configuring/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "McMojave")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.config({
    -- See https://wiki.hyprland.org/Configuring/Variables/#cursor
    cursor = { no_hardware_cursors = 2 },
    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = { preserve_split = true, force_split = 2 },
    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = { new_status = "master", orientation = "right" },
    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = 0,
        disable_splash_rendering = true,
        disable_hyprland_logo = true,
        vrr = 2,
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
        kb_layout = "fr",
        kb_variant = "",
        kb_model = "",
        kb_rules = "",
        kb_options = "caps:escape",
        kb_file = os.getenv("HOME") .. "/.config/hypr/keymap.xkb",
        follow_mouse = 2,
        float_switch_override_focus = 0,
        sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
    xwayland = { force_zero_scaling = true },
})

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })
