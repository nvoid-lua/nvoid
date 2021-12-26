local config = require("nvoid.core.utils").load_config()
local colors = {}

vim.api.nvim_command "hi clear"
if vim.fn.exists "syntax_on" then
  vim.api.nvim_command "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true

if config.ui.theme == 'onedarker' then
  colors = require('nvoid.colors.onedarker.colors')
elseif config.ui.theme == 'nord' then
  colors = require('nvoid.colors.nord.colors')
elseif config.ui.theme == 'tokyonight' then
  colors = require('nvoid.colors.tokyonight.colors')
elseif config.ui.theme == 'doom-one' then
  colors = require('nvoid.colors.doom-one.colors')
elseif config.ui.theme == 'dracula' then
  colors = require('nvoid.colors.dracula.colors')
elseif config.ui.theme == 'gruvbox' then
  colors = require('nvoid.colors.gruvbox.colors')
elseif config.ui.theme == 'darkplus' then
  colors = require('nvoid.colors.darkplus.colors')
end

local fg = require("nvoid.core.utils").fg
local bg = require("nvoid.core.utils").bg
local grey = colors.grey

if config.ui.transparency then
   bg("Normal", "NONE")
   bg("Folded", "NONE")
   fg("Folded", "NONE")
   fg("Comment", grey)
end

if vim.tbl_isempty(colors) then
  return false
end

colors.notify_bg = 'Normal'
if config.theme == 'gruvbox.nvim' then
  colors.notify_bg = colors.bg
end

return colors
