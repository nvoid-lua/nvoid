local M = {}

local Log = require "nvoid.core.log"
local icons = require("nvoid.interface.icons")
local defaults = {
  active = false,
  on_config_done = nil,
  opts = {
    stages = "slide",
    on_open = nil,
    on_close = nil,
    timeout = 5000,
    render = "default",
    background_colour = "Normal",
    minimum_width = 50,
    icons = {
      ERROR = icons.lsp.error,
      WARN = icons.lsp.warn,
      INFO = icons.lsp.info,
      DEBUG = "",
      TRACE = "✎",
    },
  },
}

function M.config()
  nvoid.builtin.notify = vim.tbl_deep_extend("force", defaults, nvoid.builtin.notify or {})
end

function M.setup()
  if #vim.api.nvim_list_uis() == 0 then
    return
  end
  local opts = nvoid.builtin.notify and nvoid.builtin.notify.opts or defaults
  local notify = require "notify"
  notify.setup(opts)
  vim.notify = notify
  Log:configure_notifications(notify)
end

return M
