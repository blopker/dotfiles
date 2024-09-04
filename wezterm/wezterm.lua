local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Mashup Colors (terminal.sexy)'
config.font_size = 20
config.font = wezterm.font 'Monaco'

config.window_decorations = 'RESIZE'

config.window_frame = {
    font = wezterm.font({ family = 'Monaco', weight = 'Bold' }),
    font_size = 12,
}

config.window_close_confirmation = 'AlwaysPrompt'

-- Table mapping keypresses to actions
act = wezterm.action
config.keys = {
    -- Sends ESC + b and ESC + f sequence, which is used
    -- for telling your shell to jump back/forward.
    {
      -- When the left arrow is pressed
      key = 'LeftArrow',
      -- With the "Option" key modifier held down
      mods = 'OPT',
      -- Perform this action, in this case - sending ESC + B
      -- to the terminal
      action = act.SendString '\x1bb',
    },
    {
      key = 'RightArrow',
      mods = 'OPT',
      action = act.SendString '\x1bf',
    },
    { key = 'RightArrow', mods = 'SUPER', action = act.ActivateTabRelative(1) },
    { key = 'LeftArrow', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
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
    { key = 'UpArrow', mods = 'SUPER', action = act.ScrollByPage(-1) },
    { key = 'DownArrow', mods = 'SUPER', action = act.ScrollByPage(1) },

    { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab({confirm = false}) },
  }

return config