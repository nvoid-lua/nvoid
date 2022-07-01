local colors = require("nvoid.colors").get()
local blue = colors.blue
local red = colors.red
local green = colors.green
local fg_bg = require("nvoid.core.utils").fg_bg

fg_bg("DiffAdd", green, "NONE")
fg_bg("DiffChange", blue, "NONE")
fg_bg("DiffChangeDelete", red, "NONE")
fg_bg("DiffModified", red, "NONE")
fg_bg("DiffDelete", red, "NONE")

fg_bg("SignAdd", green, "NONE")
fg_bg("SignChange", blue, "NONE")
fg_bg("SignDelete", red, "NONE")

fg_bg("GitSignsAdd", green, "NONE")
fg_bg("GitSignsChange", blue, "NONE")
fg_bg("GitSignsDelete", red, "NONE")
