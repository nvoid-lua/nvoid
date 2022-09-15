local base16 = require("nvoid.builtin.base16").get_theme_tb "base_16"
local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {
  -- nvim cmp
  CmpItemAbbr = { fg = colors.white },
  CmpItemAbbrMatch = { fg = colors.blue, bold = true },
  CmpBorder = { fg = colors.grey },
  CmpDocBorder = { fg = colors.grey },

  -- cmp item kinds
  CmpItemKindConstant = { fg = base16.base09 },
  CmpItemKindFunction = { fg = base16.base0D },
  CmpItemKindIdentifier = { fg = base16.base08 },
  CmpItemKindField = { fg = base16.base08 },
  CmpItemKindVariable = { fg = base16.base0E },
  CmpItemKindSnippet = { fg = colors.red },
  CmpItemKindText = { fg = base16.base0B },
  CmpItemKindStructure = { fg = base16.base0E },
  CmpItemKindType = { fg = base16.base0A },
  CmpItemKindKeyword = { fg = base16.base07 },
  CmpItemKindMethod = { fg = base16.base0D },
  CmpItemKindConstructor = { fg = colors.blue },
  CmpItemKindFolder = { fg = base16.base07 },
  CmpItemKindModule = { fg = base16.base0A },
  CmpItemKindProperty = { fg = base16.base08 },
  CmpItemKindUnit = { fg = base16.base0E },
  CmpItemKindFile = { fg = base16.base07 },
  CmpItemKindColor = { fg = colors.red },
  CmpItemKindReference = { fg = base16.base05 },
  CmpItemKindStruct = { fg = base16.base0E },
  CmpItemKindOperator = { fg = base16.base05 },
  CmpItemKindTypeParameter = { fg = base16.base08 },
}
