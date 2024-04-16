-- Keymapping file
local wezterm = require 'wezterm'

local config = {}

local leader = "LEADER"

-- Change leader combo
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "v",
    mods = leader .. "|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
    key = "h",
    mods = leader .. "|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  {
    key = "t",
    mods = leader,
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = "x",
    mods = leader,
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    key = "h",
    mods = leader,
    action = wezterm.action.ActivatePaneDirection 'Left'
  },
  {
    key = "j",
    mods = leader,
    action = wezterm.action.ActivatePaneDirection 'Down'
  },
  {
    key = "k",
    mods = leader,
    action = wezterm.action.ActivatePaneDirection 'Up'
  },
  {
    key = "l",
    mods = leader,
    action = wezterm.action.ActivatePaneDirection 'Right'
  },
  {
    key = "n",
    mods = leader,
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = "p",
    mods = leader,
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = "]",
    mods = leader,
    action = wezterm.action.IncreaseFontSize
  },
  {
    key = "[",
    mods = leader,
    action = wezterm.action.DecreaseFontSize
  },
}
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = leader,
    action = wezterm.action.ActivateTab(i - 1),
  })
end
return config
