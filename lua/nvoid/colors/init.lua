local config = require('nvoid.core.def-config')
local colors = {}

if config.ui.theme == 'onedarker' then
  colors = require('nvoid.colors.onedarker.colors')
  vim.cmd("colorscheme onedarker")
elseif config.ui.theme == 'nord' then
  colors = require('nvoid.colors.nord.colors')
  vim.cmd("colorscheme nord")
elseif config.ui.theme == 'tokyonight' then
  colors = require('nvoid.colors.tokyonight.colors')
    vim.cmd("colorscheme tokyonight")
elseif config.ui.theme == 'doom-one' then
    colors = require('nvoid.colors.doom-one.colors')
    vim.cmd("colorscheme doom-one")
elseif config.ui.theme == 'dracula' then
    colors = require('nvoid.colors.dracula.colors')
    vim.cmd("colorscheme dracula")
elseif config.ui.theme == 'gruvbox' then
    colors = require('nvoid.colors.gruvbox.colors')
    vim.cmd("colorscheme gruvbox")
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
