local M = {}
local merge_tb = vim.tbl_deep_extend
M.load_config = function()
  local config = require("nvoid.core.def-config")
  local nvoidrc_exists, nvoidrc = pcall(require, "custom.nvoidrc")

  if nvoidrc_exists then
    if type(nvoidrc) == "table" then
      config = merge_tb("force", config, nvoidrc) or {}
    else
      vim.notify("nvoidrc must return a table!")
    end
  end

  return config
end
return M
