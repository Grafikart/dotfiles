-- Port of monitors.conf.
-- See https://wiki.hyprland.org/Configuring/Monitors/
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-1", mode = "3840x2560@60", position = "1920x0", scale = 1.6 })
hl.monitor({ output = "DP-2", mode = "2560x1440@60", position = "4320x0", scale = 1, vrr = 2 })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
-- Place workspaces on specific monitors
-- Left
hl.workspace_rule({ workspace = "5", default_name = "5", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6", default_name = "6", monitor = "HDMI-A-1" })
-- Center
hl.workspace_rule({ workspace = "1", default_name = "1", monitor = "DP-1" })
hl.workspace_rule({ workspace = "2", default_name = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", default_name = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", default_name = "4", monitor = "DP-1" })
-- Right
hl.workspace_rule({ workspace = "7", default_name = "7", monitor = "DP-2" })
hl.workspace_rule({ workspace = "8", default_name = "8", monitor = "DP-2" })
