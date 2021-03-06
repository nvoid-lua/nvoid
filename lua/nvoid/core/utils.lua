local M = {}
local cmd = vim.cmd

M.bg = function(group, col)
  cmd("hi " .. group .. " guibg=" .. col)
end

M.fg = function(group, col)
  cmd("hi " .. group .. " guifg=" .. col)
end

M.fg_bg = function(group, fgcol, bgcol)
  cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
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

return M
