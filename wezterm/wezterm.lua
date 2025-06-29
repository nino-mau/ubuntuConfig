local wezterm = require("wezterm")

local config = {}

-- === FONT ===

config.font = wezterm.font("GeistMonoNerdFont")
-- config.font = wezterm.font("IosevkaNerdFont")
-- config.font = wezterm.font("JetBrainsMonoNerdFont")
-- config.font = wezterm.font("HackNerdFont")
-- config.font = wezterm.font("FiraCodeNerdFont")

config.font_size = 11

-- config.line_height = 1.09

-- === WINDOW ===

-- Window size
config.initial_cols = 120
config.initial_rows = 29

-- Background
config.window_background_opacity = 0.5

-- === COLOR SHCEME ===

config.color_scheme = "rose-pine"

-- === PLUGINS ===

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

bar.apply_to_config(config)

-- If you want to override defaults (like enabling Spotify), you would
-- replace the line above (`bar.apply_to_config(config)`) with something like this:
-- Make sure you have spotify-tui installed first!
-- bar.apply_to_config(
--   config,
--   {
--     modules = {
--       spotify = {
--         enabled = true,
--         -- You can add other overrides here from the default config, e.g.:
--         -- max_width = 40,
--       },
--       -- Example: Disable the hostname module
--       -- hostname = {
--       --  enabled = false
--       -- },
--     },
--     -- Example: Change the position to the top
--     -- position = "top",
--   }
-- )

return config
