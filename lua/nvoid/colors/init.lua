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

if config.ui.transparent_background == 'true' then
    vim.g.transparent_background = true
elseif config.ui.transparent_background == 'false' then
    vim.g.transparent_background = false
end

if config.ui.tokyonight_style == 'day' then
    vim.g.tokyonight_style = 'day'
elseif config.ui.tokyonight_style == 'night' then
    vim.g.tokyonight_style = 'night'
elseif config.ui.tokyonight_style == 'storm' then
    vim.g.tokyonight_style = 'storm'
end

if vim.tbl_isempty(colors) then
  return false
end

colors.notify_bg = 'Normal'
if config.theme == 'gruvbox.nvim' then
  colors.notify_bg = colors.bg
end

return colors
