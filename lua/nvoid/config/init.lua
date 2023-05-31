local utils = require "nvoid.utils"
local Log = require "nvoid.core.log"

local M = {}
local user_config_dir = get_config_dir()
local user_config_file = utils.join_paths(user_config_dir, "config.lua")

---Get the full path to the user configuration file
---@return string
function M:get_user_config_path()
  return user_config_file
end

--- Initialize nvoid default configuration and variables
function M:init()
  nvoid = vim.deepcopy(require "nvoid.config.defaults")

  require("nvoid.core.keymappings").load_defaults()

  local builtins = require "nvoid.core.builtins"
  builtins.config { user_config_file = user_config_file }

  local settings = require "nvoid.config.settings"
  settings.load_defaults()

  local autocmds = require "nvoid.core.autocmds"
  autocmds.load_defaults()

  local nvoid_lsp_config = require "nvoid.lsp.config"
  nvoid.lsp = vim.deepcopy(nvoid_lsp_config)
end

--- Override the configuration with a user provided one
-- @param config_path The path to the configuration overrides
function M:load(config_path)
  local autocmds = require "nvoid.core.autocmds"
  config_path = config_path or self:get_user_config_path()
  local ok, err = pcall(dofile, config_path)
  if not ok then
    if utils.is_file(user_config_file) then
      Log:warn("Invalid configuration: " .. err)
    else
      vim.notify_once(string.format("Unable to find configuration file [%s]", config_path), vim.log.levels.WARN)
    end
  end

  autocmds.define_autocmds(nvoid.autocommands)

  vim.g.mapleader = (nvoid.leader == "space" and " ") or nvoid.leader

  require("nvoid.core.keymappings").load(nvoid.keys)

  if nvoid.reload_config_on_save then
    autocmds.enable_reload_config_on_save()
  end
end

--- Override the configuration with a user provided one
-- @param config_path The path to the configuration overrides
function M:reload()
  vim.schedule(function()
    reload("nvoid.utils.hooks").run_pre_reload()

    M:load()

    reload("nvoid.core.autocmds").configure_format_on_save()

    local plugins = reload "nvoid.plugins"
    local plugin_loader = reload "nvoid.plugin-loader"

    plugin_loader.reload { plugins, nvoid.plugins }
    reload("nvoid.utils.hooks").run_post_reload()
  end)
end

return M
