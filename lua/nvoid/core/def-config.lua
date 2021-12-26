local M = {}

-- UI
M.ui = {
  theme = 'onedarker',
  transparency = false,
  statusline = 'nvoid',
}

-- OPT
M.options = {
  clipboard = 'unnamedplus',
  cmdheight = 1,
  mouse = 'a',
  mapleader = ' ',
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
M.ts_installed = {
  "bash",
  "lua",
  "c",
  "cpp",
  "css",
  "javascript",
  "json",
  "yaml",
  "python",
}

-- Add lsp servers
M.lsp = {
  "sumneko_lua",
}

return M
