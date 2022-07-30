local colors = require("base16").get()
local ui = require("nvoid.core.utils").load_config().ui
local fg = require("base16").fg
local bg = require("base16").bg
local fg_bg = require("base16").fg_bg

if ui.transparency then
  bg("Normal", "NONE")
  bg("Folded", "NONE")
  fg("Folded", "NONE")
  fg("Comment", colors.grey)
  bg("NormalFloat", "NONE")
  bg("NvimTreeNormal", "NONE")
  bg("NvimTreeNormalNC", "NONE")
  bg("NvimTreeStatusLineNC", "NONE")
  bg("NvimTreeVertSplit", "NONE")
  fg("NvimTreeVertSplit", colors.grey)
  bg("TelescopeBorder", "NONE")
  bg("TelescopePrompt", "NONE")
  bg("TelescopeResults", "NONE")
  bg("TelescopePromptBorder", "NONE")
  bg("TelescopePromptNormal", "NONE")
  bg("TelescopeNormal", "NONE")
  bg("TelescopePromptPrefix", "NONE")
  fg("TelescopeBorder", colors.one_bg)
  fg_bg("TelescopeResultsTitle", colors.black, colors.blue)
end
