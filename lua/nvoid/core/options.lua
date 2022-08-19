local opt = vim.opt
local g = vim.g
local options = require("nvoid.core.utils").load_config().options
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
opt.showtabline = 2
vim.t.bufs = vim.api.nvim_list_bufs()
opt.laststatus = 3
opt.ai = true
opt.smartindent = true
opt.path:append({ "**" })

opt.clipboard = options.clipboard
opt.cmdheight = options.cmdheight
opt.mouse = options.mouse
g.mapleader = options.mapleader
opt.wrap = options.wrap
opt.number = options.number
opt.relativenumber = options.relative_number
opt.numberwidth = options.number_width
opt.cursorline = options.cursor_line
opt.hidden = options.hidden
opt.expandtab = options.expand_tab
opt.ignorecase = options.ignore_case
opt.smartcase = options.smart_case
opt.swapfile = options.swap_file
opt.backup = options.backup
opt.showmode = options.show_mode

local config = require("nvoid.core.utils").load_config()
vim.g.theme = config.ui.theme
vim.g.transparency = config.ui.transparency
g.vim_version = vim.version().minor
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
