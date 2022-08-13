local M = {}
local icons = require "ui.icons"
require("base16").load_highlight "notify-nvim"

M.notify = function()
  require("notify").setup {
    stages = "slide",
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { focusable = false })
    end,
    timeout = 2500,
    level = "DEBUG",
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
