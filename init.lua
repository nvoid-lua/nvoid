local base_dir = vim.env.NVOID_BASE_DIR
    or (function()
      local init_path = debug.getinfo(1, "S").source
      return init_path:sub(2):match("(.*[/\\])"):sub(1, -2)
    end)()

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

require("nvoid.bootstrap"):init(base_dir)


require("nvoid.config"):load()

local plugins = require "nvoid.plugins"
require("nvoid.plugin-loader").load { plugins, nvoid.plugins }

local Log = require "nvoid.core.log"
Log:debug "Starting Nvoid"

local commands = require "nvoid.core.commands"
commands.load(commands.defaults)

require("nvoid.lsp").setup()

-- Terminals, Statusline
require("nvoid.builtin")
