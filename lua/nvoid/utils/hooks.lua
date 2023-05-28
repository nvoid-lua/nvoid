local M = {}

local Log = require "nvoid.core.log"
local in_headless = #vim.api.nvim_list_uis() == 0

function M.run_pre_update()
  Log:debug "Starting pre-update hook"
end

function M.run_pre_reload()
  Log:debug "Starting pre-reload hook"
end

function M.run_on_packer_complete()
  Log:debug "Packer operation complete"
  vim.api.nvim_exec_autocmds("User", { pattern = "PackerComplete" })

  vim.g.colors_name = nvoid.colorscheme
  pcall(vim.cmd, "colorscheme " .. nvoid.colorscheme)

  if M._reload_triggered then
    Log:info "Reloaded configuration"
    M._reload_triggered = nil
  end
end

function M.run_post_reload()
  Log:debug "Starting post-reload hook"
  M.reset_cache()
  M._reload_triggered = true
end

---Reset any startup cache files used by Packer and Impatient
---It also forces regenerating any template ftplugin files
---Tip: Useful for clearing any outdated settings
function M.reset_cache()
  local impatient = _G.__luacache
  if impatient then
    impatient.clear_cache()
  end
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

  if vim.fn.has "nvim-0.7" ~= 1 then
    local compat_tag = "1.1.3"
    vim.notify(
      "Please upgrade your Neovim base installation. Newer version of Nvoid requires v0.7+",
      vim.log.levels.WARN
    )
    vim.wait(1000, function()
      return false
    end)
    local ret = require_clean("nvoid.utils.git").switch_nvoid_branch(compat_tag)
    if ret then
      vim.notify("Reverted to the last known compatibile version: " .. compat_tag, vim.log.levels.WARN)
    end
    return
  end

  M.reset_cache()

  Log:debug "Syncing core plugins"
  require("nvoid.plugin-loader").sync_core_plugins()

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
