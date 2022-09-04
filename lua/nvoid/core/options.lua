local opt = vim.opt
local g = vim.g
local config = require("nvoid.core.utils").load_config()

-- Defs
vim.t.bufs = vim.api.nvim_list_bufs()
g.vim_version = vim.version().minor
opt.history = 100
opt.shiftwidth = 2
opt.synmaxcol = 240
opt.tabstop = 4
opt.pumheight = 10
opt.timeoutlen = 150
opt.completeopt = "menuone,noselect"
opt.updatetime = 300
opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true
opt.ai = true
opt.smartindent = true
opt.path:append({ "**" })

-- User Config
g.theme = config.ui.theme
g.transparency = config.ui.transparency
g.mapleader = config.options.mapleader
opt.clipboard = config.options.clipboard
opt.cmdheight = config.options.cmdheight
opt.laststatus = config.options.laststatus
opt.hidden = config.options.hidden
opt.mouse = config.options.mouse
opt.wrap = config.options.wrap
opt.number = config.options.number
opt.relativenumber = config.options.relative_number
opt.numberwidth = config.options.number_width
opt.cursorline = config.options.cursor_line
opt.expandtab = config.options.expand_tab
opt.ignorecase = config.options.ignore_case
opt.smartcase = config.options.smart_case
opt.swapfile = config.options.swap_file
opt.backup = config.options.backup
opt.showmode = config.options.show_mode

-- disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
