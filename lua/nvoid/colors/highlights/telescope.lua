local colors = require("nvoid.colors").get()

local black = colors.black
local black2 = colors.black2
local darker_black = colors.darker_black
local green = colors.green
local red = colors.red
local white = colors.white
local yellow = colors.yellow

local fg = require("nvoid.core.utils").fg
local fg_bg = require("nvoid.core.utils").fg_bg
local bg = require("nvoid.core.utils").bg

fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)
fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", red, black2)
fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)
fg("TelescopeMatching", yellow)
bg("TelescopeSelection", black2)
bg("TelescopeNormal", darker_black)
