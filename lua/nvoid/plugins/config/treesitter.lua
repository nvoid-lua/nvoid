local M = {}
local Log = require "nvoid.core.log"

M.config = function()
  nvoid.builtin.treesitter = {
    on_config_done = nil,
    ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    auto_install = true,
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      use_languagetree = true,
    },
    indent = { enable = true, },
    ignore_install = {},
  }
end

M.setup = function()
  -- avoid running in headless mode since it's harder to detect failures
  if #vim.api.nvim_list_uis() == 0 then
    Log:debug "headless mode detected, skipping running setup for treesitter"
    return
  end

  local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    Log:error "Failed to load nvim-treesitter.configs"
    return
  end

  local opts = vim.deepcopy(nvoid.builtin.treesitter)

  treesitter_configs.setup(opts)

  if nvoid.builtin.treesitter.on_config_done then
    nvoid.builtin.treesitter.on_config_done(treesitter_configs)
  end
end

return M
