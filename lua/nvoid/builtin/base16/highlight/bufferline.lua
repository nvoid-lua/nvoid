local colors = require("nvoid.builtin.base16").get_theme_tb("base_30")

return {
  lineFill = { bg = colors.black2 },
  LineBufOn = { fg = colors.white, bg = colors.black },
  LineBufOff = { fg = colors.light_grey, bg = colors.black2 },
  LineBufOnModified = { fg = colors.green, bg = colors.black },
  BufLineBufOffModified = { fg = colors.red, bg = colors.black2 },
  LineBufOnClose = { fg = colors.red, bg = colors.black },
  LineBufOffClose = { fg = colors.light_grey, bg = colors.black2 },
  lineTabNewBtn = { fg = colors.white, bg = colors.one_bg3 },
  LineTabOn = { fg = colors.black, bg = colors.nord_blue },
  LineTabOff = { fg = colors.white, bg = colors.one_bg2 },
  LineTabCloseBtn = { fg = colors.black, bg = colors.nord_blue },
  TabTitle = { fg = colors.black, bg = colors.white },
  LineThemeToggleBtn = { fg = colors.white, bg = colors.one_bg3 },
  LineCloseAllBufsBtn = { bg = colors.red, fg = colors.black },
}
