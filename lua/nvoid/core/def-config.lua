local M = {}

-- UI
M.ui = {
  theme = "onedarker", -- default theme
  transparency = false,
  statusline = {
    config = "%!v:lua.require('nvoid.ui.statusline').run()",
    style = "nvoid",
    enabled = true,
  },
  bufferline = {
    enabled = true,
    always_show = true,
  },
}
-- OPT
M.options = {
  clipboard = "unnamedplus",
  laststatus = 3,
  hidden = false,
  cmdheight = 1,
  mouse = "a",
  mapleader = " ",
  wrap = false,
  number = true,
  relative_number = false,
  number_width = 6,
  cursor_line = true,
  expand_tab = true,
  ignore_case = true,
  smart_case = true,
  swap_file = false,
  backup = false,
  show_mode = false,
}

-- Add Treesitter langs
M.ts_add = {
  "bash",
  "lua",
  "c",
  "cpp",
  "css",
  "json",
  "yaml",
  "python",
}

-- Lsp
M.lsp = {
  add = { "lua-language-server", "sumneko_lua" },
  virtual_text = true,
  document_highlight = true,
  autoforamt = false,
}

-- Plugins
M.plugins = {
  add = {},
  remove = {
    alpha = false,
    blankline = false,
    colorizer = false,
    gitsigns = false,
    nvimtree = false,
  },
  nvimtree = {
    git = true,
    indent_markers = true,
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
}

-- Add new whichkey bind
M.whichkey_add = {}

return M
