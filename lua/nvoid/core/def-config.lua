local M = {}

-- UI
M.ui = {
  theme = "onedark", -- default theme
  transparency = false,
  statusline = {
    enable = true,
    style = "nvoid",
  },
}
-- OPT
M.options = {
  clipboard = "unnamedplus",
  cmdheight = 1,
  mouse = "a",
  mapleader = " ",
  wrap = false,
  number = true,
  relative_number = false,
  number_width = 6,
  cursor_line = true,
  hidden = true,
  expand_tab = true,
  ignore_case = true,
  smart_case = true,
  smart_indent = true,
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
  add = { "sumneko_lua" },
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
}

-- Add new whichkey bind
M.whichkey_add = {}

return M
