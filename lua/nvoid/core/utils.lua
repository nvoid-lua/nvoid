local M = {}
local api = vim.api

M.bufferclose = function(bufnr)
  if vim.bo.buftype == "terminal" then
    vim.cmd(vim.bo.buflisted and "set nobl | enew" or "hide")
  elseif vim.bo.modified then
    print "save the file bruh"
  else
    bufnr = bufnr or api.nvim_get_current_buf()
    require("nvoid.core.utils").bufferlineprev()
    vim.cmd("bd" .. bufnr)
  end
end

M.load_config = function()
  local conf = require "nvoid.core.def-config"
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

M.bufilter = function()
  local bufs = vim.t.bufs
  for i = #bufs, 1, -1 do
    if not vim.api.nvim_buf_is_valid(bufs[i]) then
      table.remove(bufs, i)
    end
  end
  return bufs
end

M.bufferlinenext = function()
  local bufs = M.bufilter() or {}

  for i, v in ipairs(bufs) do
    if api.nvim_get_current_buf() == v then
      vim.cmd(i == #bufs and "b" .. bufs[1] or "b" .. bufs[i + 1])
      break
    end
  end
end

M.bufferlineprev = function()
  local bufs = M.bufilter() or {}

  for i, v in ipairs(bufs) do
    if api.nvim_get_current_buf() == v then
      vim.cmd(i == 1 and "b" .. bufs[#bufs] or "b" .. bufs[i - 1])
      break
    end
  end
end

-- closes tab + all of its buffers
M.closeallbufs = function(action)
  local bufs = vim.t.bufs

  if action == "closeTab" then
    vim.cmd "tabclose"
  end

  for _, buf in ipairs(bufs) do
    M.bufferclose(buf)
  end

  if action ~= "closeTab" then
    vim.cmd "enew"
  end
end

return M
