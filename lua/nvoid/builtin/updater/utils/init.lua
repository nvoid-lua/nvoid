local M = {}
M.update_nvoid = require("nvoid.builtin.updater")
M.echo = function(opts)
  if opts == nil or type(opts) ~= "table" then
    return
  end
  vim.api.nvim_echo(opts, false, {})
end
M.clear_last_echo = function()
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
