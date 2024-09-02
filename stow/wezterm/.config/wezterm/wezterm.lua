local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox Dark (Gogh)'

config.enable_csi_u_key_encoding = true

-- font
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.font_size = 12.0
config.line_height = 1.1

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.5,
}

config.exit_behavior = 'Close'

-- tab
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

return config
