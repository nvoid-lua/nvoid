local colors = require("nvoid.colors").get()
local blue = colors.blue
local red = colors.red
local grey_fg = colors.grey_fg
local fg_bg = require("nvoid.core.utils").fg_bg

fg_bg("DiffAdd", blue, "NONE")
fg_bg("DiffChange", grey_fg, "NONE")
fg_bg("DiffChangeDelete", red, "NONE")
fg_bg("DiffModified", red, "NONE")
fg_bg("DiffDelete", red, "NONE")
