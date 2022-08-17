local M = {}

-- Opts
M.opt = {
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 6000, -- seconds
  },
  auto_clean = true,
  compile_on_sync = true,
}

local config = require("nvoid.core.utils").load_config()
-- Load
M.load = function()
  vim.cmd("packadd packer.nvim")
  local present, packer = pcall(require, "packer")
  if not present then
    return false
  end

  local use = packer.use
  packer.init(M.opt)

  -- Core
  local ok, core_plugins = pcall(require, "nvoid.plugins")
  if not ok then
    core_plugins = { def = {} }
  end

  if not vim.tbl_islist(core_plugins.def_plugins) then
    core_plugins.def_plugins = {}
  end

  -- User
  if not vim.tbl_islist(config.plugins.add) then
    config.plugins.add = {}
  end

  return packer.startup(function()
    -- Core Plugins
    if core_plugins.def_plugins and not vim.tbl_isempty(core_plugins.def_plugins) then
      for _, plugin in pairs(core_plugins.def_plugins) do
        use(plugin)
      end
    end

    -- User Plugins
    if config.plugins.add and not vim.tbl_isempty(config.plugins.add) then
      for _, plugin in pairs(config.plugins.add) do
        use(plugin)
      end
    end
  end)
end

return M
