local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {
  LspReferenceRead = { bg = colors.grey, bold = true },
  LspReferenceText = { bg = colors.grey, bold = true },
  LspReferenceWrite = { bg = colors.grey, bold = true },
  DiagnosticHint = { fg = colors.purple },
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInformation = { fg = colors.green },
  LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },
  RenameTitle = { fg = colors.black, bg = colors.blue },
  RenameBorder = { fg = colors.grey, bg = colors.black },
}
