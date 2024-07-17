-- Determine the base directory
local base_dir = vim.env.NVOID_BASE_DIR or (function()
  local init_path = debug.getinfo(1, "S").source:sub(2)
  return init_path:match("(.*[/\\])"):sub(1, -2)
end)()

-- Prepend the base directory to the runtime path if it's not already included
if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:prepend(base_dir)
end

-- Initialize Nvoid with the base directory
require("nvoid.bootstrap"):init(base_dir)
require("nvoid.config"):load()

-- Load plugins
local plugins = require("nvoid.plugins")
require("nvoid.plugin-loader").load { plugins, nvoid.plugins }

-- Start logging
local Log = require("nvoid.core.log")
Log:debug "Starting Nvoid"

-- Load default commands
local commands = require("nvoid.core.commands")
commands.load(commands.defaults)

-- Load UI
require("nvoid.ui")
