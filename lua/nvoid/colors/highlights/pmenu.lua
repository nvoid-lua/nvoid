local colors = require("nvoid.colors").get()

local blue = colors.blue
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local pmenu_bg = colors.pmenu_bg
local white = colors.white

local fg = require("nvoid.core.utils").fg
local bg = require("nvoid.core.utils").bg

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", pmenu_bg)
bg("PmenuThumb", nord_blue)
fg("CmpItemAbbr", white)
fg("CmpItemAbbrMatch", blue)
fg("CmpItemKind", white)
fg("CmpItemMenu", white)
