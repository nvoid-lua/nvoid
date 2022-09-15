local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {
  IndentBlanklineChar = { fg = colors.line },
  IndentBlanklineSpaceChar = { fg = colors.line },
  IndentBlanklineContextChar = { fg = colors.blue },
}
