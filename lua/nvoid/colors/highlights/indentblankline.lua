local colors = require("nvoid.colors").get()
local line = colors.line
local blue = colors.blue
local fg = require("nvoid.core.utils").fg

fg("IndentBlanklineChar", line)
fg("IndentBlanklineContextChar", blue)
