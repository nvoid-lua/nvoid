local M = {}
local colors = require("base16").get()
local icons = require "nvoid.ui.icons"

M.notify = function()
  require("notify").setup {
    stages = "slide",
    on_open = nil,
    on_close = nil,
    render = "minimal",
    timeout = 5000,
    background_colour = colors.black,
    minimum_width = 50,
    icons = {
      ERROR = icons.lsp.error,
      WARN = icons.lsp.warn,
      INFO = icons.lsp.info,
      DEBUG = icons.lsp.debug,
      TRACE = "✎",
    },
  }
  local notify = require "notify"
  vim.notify = notify
end

return M
