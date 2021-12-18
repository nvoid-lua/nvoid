local M = {}

-- UI
M.ui = {
  theme = 'darkplus',                  -- 'onedarker' 'gruvbox' 'dracula' 'doom-one' 'tokyonight' 'nord'
  transparent_background = 'false',     -- 'false' 'true'
  tokyonight_style = 'night',           -- 'night' 'storm' 'day'
}

-- OPT
M.options = {
  clipboard = 'unnamedplus', -- 'unnamed',
  cmdheight = 1,
  mouse = 'a',
  mapleader = ' ',
  number = 'true',
  relative_number = 'false',
  number_width = 4,
  cursor_line = 'true',
  split_right = 'true',
  split_below = 'tue',
  show_match = 'true',
  lazy_redraw = 'true',
  hidden = 'true',
  expand_tab = 'true',
  ignore_case = 'true',
  smart_case = 'true',
  smart_indent = 'true',
  swap_file = 'false',
  backup = 'false',
  show_mode = 'false',
  wrap = 'false',
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
  -- "sumneko_lua",
  "bashls",
}
return M
