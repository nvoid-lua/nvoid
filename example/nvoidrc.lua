local M = {}

-- UI
M.ui = {
  theme = "onedark", -- aquarium | catppuccin | classic-dark | dracula | gruvbox | nightfox | nord | onedark | radium | solarized | tokyodark | uwu
  transparency = false,
  statusline = {
    style = "nvoid", -- evil | minimal | nvoid
    enabled = true,
  },
  bufferline = {
    enabled = true,
    lazyload = true,
  }
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
M.ts_add = {} -- fish

-- Lsp
M.lsp = {
  add = {},
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

-- Note: Visit "https://github.com/ysfgrgO7/nvoid-custom-config" For more info how the file works

return M
