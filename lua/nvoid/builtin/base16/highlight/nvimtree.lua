local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {
  NvimTreeEmptyFolderName = { fg = colors.folder_bg },
  NvimTreeFolderIcon = { fg = colors.folder_bg },
  NvimTreeFolderName = { fg = colors.folder_bg },
  NvimTreeRootFolder = { fg = colors.red },
  NvimTreeOpenedFolderName = { fg = colors.folder_bg },
  NvimTreeGitDirty = { fg = colors.red },
  NvimTreeGitStaged = { fg = colors.blue },
  NvimTreeGitNew = { fg = colors.yellow },
  NvimTreeGitDeleted = { fg = colors.red },
  NvimTreeGitMerge = { fg = colors.light_grey },
  NvimTreeGitRenamed = { fg = colors.light_grey },
  NvimTreeNormal = { bg = colors.darker_black },
  NvimTreeNormalNC = { bg = colors.darker_black },
  NvimTreeIndentMarker = { fg = colors.folder_bg },
  NvimTreeEndOfBuffer = { fg = colors.darker_black },
  NvimTreeWindowPicker = { fg = colors.red, bg = colors.black2 },
  NvimTreeCursorLine = { bg = colors.one_bg3 },
  NvimTreeGitIgnored = { fg = colors.purple },
  NvimTreeWinSeparator = { fg = colors.darker_black, bg = colors.darker_black },
}
