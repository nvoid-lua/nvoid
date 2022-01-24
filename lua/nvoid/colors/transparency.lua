local colors = require("nvoid.colors").get()
local ui = require("nvoid.core.utils").load_config().ui
local black = colors.black
local blue = colors.blue
local grey = colors.grey
local one_bg = colors.one_bg
local fg = require("nvoid.core.utils").fg
local fg_bg = require("nvoid.core.utils").fg_bg
local bg = require("nvoid.core.utils").bg

if ui.transparency then
	bg("Normal", "NONE")
	bg("Folded", "NONE")
	fg("Folded", "NONE")
	fg("Comment", grey)
end

if ui.transparency then
	bg("NormalFloat", "NONE")
	bg("NvimTreeNormal", "NONE")
	bg("NvimTreeNormalNC", "NONE")
	bg("NvimTreeStatusLineNC", "NONE")
	bg("NvimTreeVertSplit", "NONE")
	fg("NvimTreeVertSplit", grey)

	bg("TelescopeBorder", "NONE")
	bg("TelescopePrompt", "NONE")
	bg("TelescopeResults", "NONE")
	bg("TelescopePromptBorder", "NONE")
	bg("TelescopePromptNormal", "NONE")
	bg("TelescopeNormal", "NONE")
	bg("TelescopePromptPrefix", "NONE")
	fg("TelescopeBorder", one_bg)
	fg_bg("TelescopeResultsTitle", black, blue)
end
