local M = {}

local Log = require "nvoid.core.log"

function M.setup()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    Log:error "Missing null-ls dependency"
    return
  end

  local default_opts = require("nvoid.lsp").get_common_opts()
  null_ls.setup(vim.tbl_deep_extend("force", default_opts, nvoid.lsp.null_ls.setup))
end

return M
