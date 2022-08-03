vim.cmd "packadd packer.nvim"
local M = {}
M.opt = {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 6000, -- seconds
  },
  auto_clean = true,
  compile_on_sync = true,
}

M.load = function()
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
  local ok2, user_plugins = pcall(require, "custom.nvoidrc")
  if not ok2 then
    user_plugins = { add = {} }
  end

  if not vim.tbl_islist(user_plugins.plugins_add) then
    user_plugins.plugins_add = {}
  end

  return packer.startup(function()
    if core_plugins.def_plugins and not vim.tbl_isempty(core_plugins.def_plugins) then
      for _, plugin in pairs(core_plugins.def_plugins) do
        use(plugin)
      end
    end

    if user_plugins.plugins_add and not vim.tbl_isempty(user_plugins.plugins_add) then
      for _, plugin in pairs(user_plugins.plugins_add) do
        use(plugin)
      end
    end

    -- if nvoid_packer.first_install then
    --   packer.sync()
    -- end
  end)
end
return M
