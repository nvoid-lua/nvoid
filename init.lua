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
  local echo = function(str)
    vim.cmd "redraw"
    vim.api.nvim_echo({ { str, "Bold" } }, true, {})
  end

  local function shell_call(args)
    local output = vim.fn.system(args)
    assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
  end
  local lazy_path = vim.fn.stdpath "data" .. "/site/pack/lazy/opt/base16"

  echo "  compiling base16 theme to bytecode ..."

  local base16_repo = "https://github.com/nvoid-lua/base16"
  shell_call { "git", "clone", "--depth", "1", base16_repo, lazy_path }
  vim.opt.rtp:prepend(lazy_path)
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
