-- Pull in the wezterm API
local keymap = require 'keymap'
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- Execute powershell core as default
config.default_prog = {
  'C:\\Users\\d1331622\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe' }


config.leader = keymap.leader
config.keys = keymap.keys

-- and finally, return the configuration to wezterm
return config
