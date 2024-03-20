-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'

config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

config.font = wezterm.font 'JetBrainsMono Nerd Font'

config.font_size = 14

config.window_close_confirmation = 'NeverPrompt'

config.enable_tab_bar = false

config.default_cursor_style = 'SteadyBar'

-- and finally, return the configuration to wezterm
return config