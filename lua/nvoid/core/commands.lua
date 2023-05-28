local M = {}

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

M.defaults = {
  {
    name = "NvoidToggleFormatOnSave",
    fn = function()
      require("nvoid.core.autocmds").toggle_format_on_save()
    end,
  },
  {
    name = "NvoidDiagnostics",
    fn = function()
      vim.diagnostic.open_float(0, { show_header = false, severity_sort = true, scope = "line" })
    end
  },
  {
    name = "NvoidFormat",
    fn = function()
      vim.lsp.buf.format({ async = true })
    end
  },
  {
    name = "NvoidRename",
    fn = function()
      require("nvoid.interface.rename").open()
    end
  },
  {
    name = "NvoidInfo",
    fn = function()
      require("nvoid.core.info").toggle_popup(vim.bo.filetype)
    end,
  },
  {
    name = "NvoidCacheReset",
    fn = function()
      require("nvoid.utils.hooks").reset_cache()
    end,
  },
  {
    name = "NvoidReload",
    fn = function()
      require("nvoid.config"):reload()
    end,
  },
  {
    name = "NvoidUpdate",
    fn = function()
      require("nvoid.bootstrap"):update()
    end,
  },
  {
    name = "NvoidSyncCorePlugins",
    fn = function()
      require("nvoid.plugin-loader").sync_core_plugins()
    end,
  },
  {
    name = "NvoidChangelog",
    fn = function()
      require("nvoid.core.telescope.custom-finders").view_nvoid_changelog()
    end,
  },
  {
    name = "NvoidVersion",
    fn = function()
      print(require("nvoid.utils.git").get_nvoid_version())
    end,
  },
  {
    name = "NvoidOpenlog",
    fn = function()
      vim.fn.execute("edit " .. require("nvoid.core.log").get_path())
    end,
  },
}

function M.load(collection)
  local common_opts = { force = true }
  for _, cmd in pairs(collection) do
    local opts = vim.tbl_deep_extend("force", common_opts, cmd.opts or {})
    vim.api.nvim_create_user_command(cmd.name, cmd.fn, opts)
  end
end

return M
