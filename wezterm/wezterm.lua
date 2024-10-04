local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()

-- Fullscreen on startup
wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():toggle_fullscreen()
 end)

config.color_scheme = 'iTerm2 Pastel Dark Background'
config.font_size = 20
config.font = wezterm.font 'Monaco'

config.window_decorations = 'RESIZE'

config.window_frame = {
    font = wezterm.font({ family = 'Monaco', weight = 'Bold' }),
    font_size = 12,
}

-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.window_close_confirmation = 'AlwaysPrompt'

-- Table mapping keypresses to actions
config.keys = {
    -- Sends ESC + b and ESC + f sequence, which is used
    -- for telling your shell to jump back/forward.
    {
      key = 'LeftArrow',
      mods = 'OPT',
      action = act.SendString '\x1bb',
    },
    {
      key = 'RightArrow',
      mods = 'OPT',
      action = act.SendString '\x1bf',
    },

    -- Tab navigation
    { key = 'RightArrow', mods = 'SUPER', action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow', mods = 'SUPER', action = act.ActivateTabRelative(-1) },

    -- Open config file
    {
        key = ',',
        mods = 'SUPER',
        action = act.SpawnCommandInNewTab {
          cwd = wezterm.home_dir,
          args = { 'code', wezterm.config_file },
        },
    },
    {
        key = 'Enter',
        mods = 'SUPER',
        action = act.ToggleFullScreen,
    },

    { key = 'w', mods = 'SUPER', action = act.CloseCurrentPane({confirm = false}) },
    { key = 'w', mods = 'SUPER|SHIFT', action = act.CloseCurrentTab({confirm = false}) },

    -- Pane navigation
    { key = 'UpArrow', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Up', },
    { key = 'DownArrow', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Down', },
    { key = 'LeftArrow', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Left', },
    { key = 'RightArrow', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Right', },
    { key = '\\', mods = 'SUPER', action = act.SplitVertical, },
    { key = '|', mods = 'SUPER', action = act.SplitHorizontal, },

  }

return config