-- Pull in the wezterm API
local keymap = require 'keymap'
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- Execute powershell core as default
config.default_prog = { '/bin/zsh' }


config.leader = keymap.leader
config.keys = keymap.keys

-- and finally, return the configuration to wezterm
return config
