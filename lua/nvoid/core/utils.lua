local M = {}
local merge_tb = vim.tbl_deep_extend

M.update_nvoid = require("nvoid.core.updater.update")

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

-- Updater
M.echo = function(opts)
  if opts == nil or type(opts) ~= "table" then
    return
  end
  vim.api.nvim_echo(opts, false, {})
end
M.clear_last_echo = function()
  -- wrap this with inputsave and inputrestore just in case
  vim.fn.inputsave()
  vim.api.nvim_feedkeys(":", "nx", true)
  vim.fn.inputrestore()
end

M.cmd = function(cmd, print_error)
  local result = vim.fn.system(cmd)
  if vim.api.nvim_get_vvar("shell_error") ~= 0 then
    if print_error then
      vim.api.nvim_err_writeln("Error running command:\n" .. cmd .. "\nError message:\n" .. result)
    end
    return nil
  end
  return result
end

return M
