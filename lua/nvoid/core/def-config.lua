local M = {}

-- UI
M.ui = {
  theme = "onedark",
  transparency = false,
  statusline = {
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
  nvimtree_indent_markers = true,
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

-- Lsp Settings
M.lsp = {
  document_highlight = true,
  autoforamt = false,
}

-- Add Lsp servers
M.lsp_add = {}

-- Add new whichkey bind
M.whichkey_add = {}

return M
