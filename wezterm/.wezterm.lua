-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.automatically_reload_config = true

-- For example, changing the color scheme:
-- config.color_scheme = 'Vibrant Ink'
config.color_scheme = 'Urple'
config.window_background_opacity = 0.95
config.text_background_opacity = 1
config.font = wezterm.font_with_fallback {
  'Hasklug Nerd Font',
  'Fira Mono',
  'Fira Code'
}



-- and finally, return the configuration to wezterm
return config
