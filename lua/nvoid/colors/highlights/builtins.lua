local colors = require("nvoid.colors").get()
local ui = require("nvoid.core.utils").load_config().ui
local black = colors.black
local blue = colors.blue
local darker_black = colors.darker_black
local grey = colors.grey
local grey_fg = colors.grey_fg
local one_bg2 = colors.one_bg2
local red = colors.red
local white = colors.white
local one_bg3 = colors.one_bg3
local green = colors.green
local yellow = colors.yellow
local purple = colors.purple
local orange = colors.orange

local fg = require("nvoid.core.utils").fg
local bg = require("nvoid.core.utils").bg
local fg_bg = require("nvoid.core.utils").fg_bg

if ui.italic_comments then
	fg("Comment", grey_fg .. " gui=italic")
else
	fg("Comment", grey_fg)
end

fg("cursorlinenr", white)
fg("EndOfBuffer", black)
fg("FloatBorder", blue)
bg("NormalFloat", darker_black)
-- fg("StatusLineNC", one_bg3 .. " gui=underline")
fg("LineNr", grey)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)
fg_bg("CheatsheetBorder", black, black)
bg("CheatsheetSectionContent", black)
fg("CheatsheetHeading", white)

local section_title_colors = {
	white,
	blue,
	red,
	green,
	yellow,
	purple,
	orange,
}
for i, color in ipairs(section_title_colors) do
	vim.cmd("highlight CheatsheetTitle" .. i .. " guibg = " .. color .. " guifg=" .. black)
end
