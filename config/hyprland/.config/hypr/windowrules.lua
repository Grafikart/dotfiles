-- Port of windowrules.conf.
-- Window Rules (adapted to new syntax)
-- Wofi
hl.window_rule({ name = "wofi-float", match = { class = "^(wofi)$" }, float = true })

-- Force windows on specific workspaces
hl.window_rule({ name = "ide-workspace", match = { class = "^(Code|PHPStorm)$" }, workspace = 1 })
hl.window_rule({ name = "discord-workspace", match = { class = "^(discord)$" }, workspace = 5 })
hl.window_rule({ name = "music-workspace", match = { title = "^(Spotify|YouTube Music).*$" }, workspace = 8 })
hl.window_rule({ name = "music-tiled", match = { title = "^(Spotify|YouTube Music).*$" }, tile = true })
hl.window_rule({ name = "suppress-maximize", match = { class = ".*" }, suppress_event = "maximize" })

-- Improve JetBrains popups (floating only)
local jetbrains_float = { class = "^.*(jetbrains).*$", float = true }
hl.window_rule({ name = "jetbrains-max-size", match = jetbrains_float, max_size = { 2400, 1400 } })
hl.window_rule({ name = "jetbrains-min-size", match = jetbrains_float, min_size = { 400, 800 } })
hl.window_rule({ name = "jetbrains-no-border", match = jetbrains_float, border_size = 0 })

-- Improve file picker popups
hl.window_rule({ name = "file-manager-max-size", match = { class = "^(pcmanfm|Thunar|thunar)$", float = true }, max_size = { 1150, 650 } })
hl.window_rule({ name = "portal-filepicker-tag", match = { class = "^Xdg-desktop-portal-gtk$", float = true }, tag = "filepicker" })
hl.window_rule({ name = "filepicker-min-size", match = { tag = "filepicker" }, min_size = { 1000, 700 } })
hl.window_rule({ name = "filepicker-no-border", match = { tag = "filepicker" }, border_size = 0 })
hl.window_rule({ name = "filepicker-no-shadow", match = { tag = "filepicker" }, no_shadow = true })
hl.window_rule({ name = "speedcrunch-max-size", match = { title = "^(SpeedCrunch)$" }, max_size = { 950, 560 } })

-- Floating windows
hl.window_rule({ name = "file-manager-float", match = { class = "^(pcmanfm|Thunar)$" }, float = true })
for _, title in ipairs({ "SpeedCrunch", "Open", "Choose Files", "Save As", "Confirm to replace files", "File Operation Progress" }) do
  hl.window_rule({ name = "float-" .. title, match = { title = "^(" .. title .. ")$" }, float = true })
end
hl.window_rule({ name = "portal-float", match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })

-- Picture-in-picture
local pip = { initial_title = "^(Mode PIP).*$" }
hl.window_rule({ name = "pip-no-max-size", match = pip, no_max_size = true })
hl.window_rule({ name = "pip-min-size", match = pip, min_size = { 800, 600 } })
