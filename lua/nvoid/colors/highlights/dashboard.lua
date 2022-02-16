local colors = require("nvoid.colors").get()
local grey_fg = colors.grey_fg
local purple = colors.purple
local cyan = colors.cyan
local blue = colors.blue
local fg = require("nvoid.core.utils").fg

fg("DashboardCenter", purple)
fg("DashboardFooter", cyan)
fg("DashboardHeader", blue)
fg("DashboardShortcut", grey_fg)
