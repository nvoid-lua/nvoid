local M = {}

M.update_nvoid = require("nvoid.core.updater.update")

M.load_config = function()
  local conf = require("nvoid.core.def-config")
  local nvoidrcExists, change = pcall(require, "custom.nvoidrc")
  if nvoidrcExists then
    conf = vim.tbl_deep_extend("force", conf, change)
  end
  return conf
end

M.override_req = function(name, default_req)
  local override = require("nvoid.core.utils").load_config().plugins.default_plugin_config_replace[name]
  local result = default_req

  if override ~= nil then
    result = override
  end

  if string.match(result, "^%(") then
    result = result:sub(2)
    result = result:gsub("%)%.", "').", 1)
    return "require('" .. result
  end

  return "require('" .. result .. "')"
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
