-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"

config.default_prog = { "/usr/bin/fish", "-l" }

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.freetype_load_flags = "NO_HINTING"
config.font_size = 13

config.window_close_confirmation = "NeverPrompt"

config.enable_tab_bar = false

config.default_cursor_style = "SteadyBar"

-- and finally, return the configuration to wezterm
return config
