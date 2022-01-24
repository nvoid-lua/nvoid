local colors = require("nvoid.colors").get()
local green = colors.green
local grey = colors.grey
local purple = colors.purple
local red = colors.red
local yellow = colors.yellow
local fg = require("nvoid.core.utils").fg
local bg = require("nvoid.core.utils").bg

bg("LspReferenceRead", grey)
bg("LspReferenceText", grey)
bg("LspReferenceWrite", grey)
fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", green)
