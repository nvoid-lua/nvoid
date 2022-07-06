local colors = require("nvoid.colors").get()
local grey_fg = colors.grey_fg
local red = colors.red
local green = colors.green
local yellow = colors.yellow
local purple = colors.purple
local bg = colors.bg
local fg = require("nvoid.core.utils").fg
local bg = require("nvoid.core.utils").bg

fg("NotifyERRORBorder", red)
fg("NotifyWARNBorder", yellow)
fg("NotifyINFOBorder", green)
fg("NotifyDEBUGBorder", grey_fg)
fg("NotifyTRACEBorder", purple)
fg("NotifyERRORIcon", red)
fg("NotifyWARNIcon", yellow)
fg("NotifyINFOIcon", green)
fg("NotifyDEBUGIcon", grey_fg)
fg("NotifyTRACEIcon", purple)
fg("NotifyERRORTitle", red)
fg("NotifyWARNTitle", yellow)
fg("NotifyINFOTitle", green)
fg("NotifyDEBUGTitle", grey_fg)
fg("NotifyTRACETitle", purple)
