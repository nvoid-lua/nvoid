return {
  leader = "space",
  colorscheme = "onedarker",
  transparent_window = false,
  format_on_save = {
    ---@usage pattern string pattern used for the autocommand (Default: '*')
    pattern = "*",
    ---@usage timeout number timeout in ms for the format request (Default: 1000)
    timeout = 1000,
    ---@usage filter func to select client
    filter = require("nvoid.lsp.utils").format_filter,
  },
  keys = {},

  use_icons = true,
  icons = require "nvoid.builtin.icons",

  builtin = {},
  statusline = {
    enabled = true,
    config = "%!v:lua.require('nvoid.builtin.statusline').run()",
    style = "nvoid"
  },
  terminal = {
    behavior = {
      close_on_exit = true,
    },
    window = {
      vsplit_ratio = 0.5,
      split_ratio = 0.3,
    },
  },

  plugins = {
    -- use config.lua for this not put here
  },

  autocommands = {},
  lang = {},
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = "warn",
    viewer = {
      ---@usage this will fallback on "less +F" if not found
      cmd = "lnav",
      layout_config = {
        ---@usage direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = "horizontal",
        open_mapping = "",
        size = 40,
        float_opts = {},
      },
    },
    -- currently disabled due to instabilities
    override_notify = false,
  },
}
