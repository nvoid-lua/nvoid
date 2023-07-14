local base_dir = vim.env.NVOID_BASE_DIR
    or (function()
      local init_path = debug.getinfo(1, "S").source
      return init_path:sub(2):match("(.*[/\\])"):sub(1, -2)
    end)()

if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:prepend(base_dir)
end

require("nvoid.bootstrap"):init(base_dir)
require("nvoid.config"):load()

vim.g.base16_cache = vim.fn.stdpath "data" .. "/base16/"
vim.g.theme = nvoid.ui.colorscheme
vim.g.transparency = nvoid.ui.transparency

if not vim.loop.fs_stat then
  require("base16").compile()
end

local plugins = require "nvoid.plugins"
require("nvoid.plugin-loader").load { plugins, nvoid.plugins }
dofile(vim.g.base16_cache .. "defaults")

local Log = require "nvoid.core.log"
Log:debug "Starting Nvoid"

local commands = require "nvoid.core.commands"
commands.load(commands.defaults)
require("nvoid.ui")
