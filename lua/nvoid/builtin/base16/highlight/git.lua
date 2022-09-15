local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {
  DiffFile = { fg = colors.cyan },
  DiffIndexLine = { fg = colors.grey },
  GitSignsAdd = { fg = colors.blue },
  GitSignsChange = { fg = colors.light_grey },
  GitSignsDelete = { fg = colors.red },
  SignAdd = { fg = colors.blue },
  SignChange = { fg = colors.light_grey },
  SignDelete = { fg = colors.red },
}
