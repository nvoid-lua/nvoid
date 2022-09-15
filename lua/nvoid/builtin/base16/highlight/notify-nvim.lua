local colors = require("nvoid.builtin.base16").get_theme_tb "base_30"

return {
  NotifyERRORBorder = { fg = colors.red },
  NotifyWARNBorder = { fg = colors.yellow },
  NotifyINFOBorder = { fg = colors.green },
  NotifyDEBUGBorder = { fg = colors.purple },
  NotifyTRACEBorder = { fg = colors.purple },
  NotifyERRORIcon = { fg = colors.red },
  NotifyWARNIcon = { fg = colors.yellow },
  NotifyINFOIcon = { fg = colors.green },
  NotifyDEBUGIcon = { fg = colors.purple },
  NotifyTRACEIcon = { fg = colors.purple },
  NotifyERRORTitle = { fg = colors.red },
  NotifyWARNTitle = { fg = colors.yellow },
  NotifyINFOTitle = { fg = colors.green },
  NotifyDEBUGTitle = { fg = colors.purple },
  NotifyTRACETitle = { fg = colors.purple },
  NotifyERRORBody = { fg = colors.white },
  NotifyWARNBody = { fg = colors.white },
  NotifyINFOBody = { fg = colors.white },
  NotifyDEBUGBody = { fg = colors.white },
  NotifyTRACEBody = { fg = colors.white },
}
