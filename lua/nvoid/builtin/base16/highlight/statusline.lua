local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {

  StatusLine = { bg = colors.statusline_bg },

  -- TreeSitter
  St_Treesitter = { fg = colors.green, bg = colors.statusline_bg },

  -- Git
  St_gitIcons = { fg = colors.light_grey, bg = colors.statusline_bg },
  St_gitAdd = { fg = colors.green, bg = colors.statusline_bg },
  St_gitMod = { fg = colors.yellow, bg = colors.statusline_bg },
  St_gitRem = { fg = colors.red, bg = colors.statusline_bg },

  -- LSP
  St_lspError = { fg = colors.red, bg = colors.statusline_bg },
  St_lspWarning = { fg = colors.yellow, bg = colors.statusline_bg },
  St_LspHints = { fg = colors.purple, bg = colors.statusline_bg },
  St_LspInfo = { fg = colors.green, bg = colors.statusline_bg },
  St_LspStatus = { fg = colors.white, bg = colors.statusline_bg },
  St_LspProgress = { fg = colors.green, bg = colors.statusline_bg },
  St_LspStatus_Icon = { fg = colors.black, bg = colors.nord_blue },

  -- MODES
  -- Nvoid
  St_NormalMode = { fg = colors.black, bg = colors.nord_blue },
  St_InsertMode = { fg = colors.black, bg = colors.dark_purple },
  St_TerminalMode = { fg = colors.black, bg = colors.green },
  St_NTerminalMode = { fg = colors.black, bg = colors.yellow },
  St_VisualMode = { fg = colors.black, bg = colors.cyan },
  St_ReplaceMode = { fg = colors.black, bg = colors.orange },
  St_ConfirmMode = { fg = colors.black, bg = colors.teal },
  St_CommandMode = { fg = colors.black, bg = colors.green },
  St_SelectMode = { fg = colors.black, bg = colors.nord_blue },
  -- Min
  St_ModeM = { fg = colors.nord_blue, bg = colors.statusline_bg },
  -- Evil
  St_NormalModeE = { bg = colors.black, fg = colors.nord_blue },
  St_InsertModeE = { bg = colors.black, fg = colors.dark_purple },
  St_TerminalModeE = { bg = colors.black, fg = colors.green },
  St_NTerminalModeE = { bg = colors.black, fg = colors.green },
  St_VisualModeE = { bg = colors.black, fg = colors.cyan },
  St_ReplaceModeE = { bg = colors.black, fg = colors.orange },
  St_ConfirmModeE = { bg = colors.black, fg = colors.teal },
  St_CommandModeE = { bg = colors.black, fg = colors.green },
  St_SelectModeE = { bg = colors.black, fg = colors.nord_blue },

  St_EmptySpace = { fg = colors.grey, bg = colors.lightbg },
  St_EmptySpace2 = { fg = colors.grey, bg = colors.statusline_bg },
  St_file_info = { bg = colors.lightbg, fg = colors.white },
  St_file_sep = { bg = colors.statusline_bg, fg = colors.lightbg },
  St_pos_text = { fg = colors.yellow, bg = colors.lightbg },
}
