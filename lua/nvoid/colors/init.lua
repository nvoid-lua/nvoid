local config = require("nvoid.core.utils").load_config()
local colors = {}

vim.api.nvim_command("hi clear")
if vim.fn.exists("syntax_on") then
	vim.api.nvim_command("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true

if config.ui.theme == "onedarker" then
	colors = require("nvoid.colors.themes.onedarker.colors")
elseif config.ui.theme == "tokyonight" then
	colors = require("nvoid.colors.themes.tokyonight.colors")
elseif config.ui.theme == "darkplus" then
	colors = require("nvoid.colors.themes.darkplus.colors")
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

bg("TelescopeBorder", colors.bg)
fg("TelescopeBorder", colors.bg)

bg("TelescopePromptBorder", colors.grey)
fg("TelescopePromptBorder", colors.grey)

bg("TelescopePromptNormal", colors.grey)
fg("TelescopePromptNormal", colors.fg)

bg("TelescopePromptPrefix", colors.grey)
fg("TelescopePromptPrefix", colors.red)

bg("TelescopeNormal", colors.bg)

bg("TelescopePreviewTitle", colors.green)
fg("TelescopePreviewTitle", colors.bg)

bg("TelescopePromptTitle", colors.red)
fg("TelescopePromptTitle", colors.bg)

bg("TelescopeResultsTitle", colors.bg)
fg("TelescopeResultsTitle", colors.bg)

bg("TelescopeSelection", colors.grey)
fg("TelescopeSelection", colors.blue)

fg("TelescopeMatching", colors.yellow)

if vim.tbl_isempty(colors) then
	return false
end

return colors
