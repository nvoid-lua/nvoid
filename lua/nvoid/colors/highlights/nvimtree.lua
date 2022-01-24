local colors = require("nvoid.colors").get()

local black2 = colors.black2
local darker_black = colors.darker_black
local folder_bg = colors.folder_bg
local one_bg2 = colors.one_bg2
local red = colors.red
local fg = require("nvoid.core.utils").fg
local fg_bg = require("nvoid.core.utils").fg_bg
local bg = require("nvoid.core.utils").bg

-- NvimTree
fg("NvimTreeEmptyFolderName", folder_bg)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", one_bg2)
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeOpenedFolderName", folder_bg)
fg("NvimTreeRootFolder", red)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)
