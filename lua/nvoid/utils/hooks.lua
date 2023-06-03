local M = {}

local Log = require "nvoid.core.log"
local in_headless = #vim.api.nvim_list_uis() == 0
local plugin_loader = require "nvoid.plugin-loader"

function M.run_pre_update()
  Log:debug "Starting pre-update hook"
end

function M.run_pre_reload()
  Log:debug "Starting pre-reload hook"
end

-- TODO: convert to lazy.nvim
-- function M.run_on_packer_complete()
-- -- FIXME(kylo252): nvim-tree.lua/lua/nvim-tree/view.lua:442: Invalid window id
-- vim.g.colors_name = nvoid.colorscheme
-- pcall(vim.cmd.colorscheme, nvoid.colorscheme)
-- end

function M.run_post_reload()
  Log:debug "Starting post-reload hook"
end

---Reset any startup cache files used by lazy.nvim
---It also forces regenerating any template ftplugin files
---Tip: Useful for clearing any outdated settings
function M.reset_cache()
  local nvoid_modules = {}
  for module, _ in pairs(package.loaded) do
    if module:match "nvoid.core" or module:match "nvoid.lsp" then
      package.loaded[module] = nil
      table.insert(nvoid_modules, module)
    end
  end
  Log:trace(string.format("Cache invalidated for core modules: { %s }", table.concat(nvoid_modules, ", ")))
  require("nvoid.lsp.templates").generate_templates()
end

function M.run_post_update()
  Log:debug "Starting post-update hook"

  if vim.fn.has "nvim-0.8" ~= 1 then
    local compat_tag = "1.1.4"
    vim.notify(
      "Please upgrade your Neovim base installation. Newer version of Nvoid requires v0.7+",
      vim.log.levels.WARN
    )
    vim.wait(1000)
    local ret = reload("nvoid.utils.git").switch_nvoid_branch(compat_tag)
    if ret then
      vim.notify("Reverted to the last known compatible version: " .. compat_tag, vim.log.levels.WARN)
    end
    return
  end

  M.reset_cache()

  Log:debug "Syncing core plugins"
  plugin_loader.reload { reload "nvoid.plugins", nvoid.plugins }
  plugin_loader.sync_core_plugins()
  M.reset_cache() -- force cache clear and templates regen once more

  if not in_headless then
    vim.schedule(function()
      if package.loaded["nvim-treesitter"] then
        vim.cmd [[ TSUpdateSync ]]
      end
      -- TODO: add a changelog
      vim.notify("Update complete", vim.log.levels.INFO)
    end)
  end
end

return M
