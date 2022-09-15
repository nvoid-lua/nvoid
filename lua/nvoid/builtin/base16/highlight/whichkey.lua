local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {
  WhichKey = { fg = colors.purple },
  WhichKeySeparator = { fg = colors.green },
  WhichKeyDesc = { fg = colors.blue },
  WhichKeyGroup = { fg = colors.cyan },
  WhichKeyValue = { fg = colors.light_grey },
  WhichKeyFloat = { bg = colors.darker_black },
}
