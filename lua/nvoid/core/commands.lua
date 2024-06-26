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
    end,
  },
  {
    name = "NvoidInfo",
    fn = function()
      require("nvoid.ui.voidashboard").toggle_popup(vim.bo.filetype)
    end,
  },
  {
    name = "NvoidDocs",
    fn = function()
      local documentation_url = "https://www.nvoid.org/"
      if vim.fn.has "mac" == 1 or vim.fn.has "macunix" == 1 then
        vim.fn.execute("!open " .. documentation_url)
      elseif vim.fn.has "win32" == 1 or vim.fn.has "win64" == 1 then
        vim.fn.execute("!start " .. documentation_url)
      elseif vim.fn.has "unix" == 1 then
        vim.fn.execute("!xdg-open " .. documentation_url)
      else
        vim.notify "Opening docs in a browser is not supported on your OS"
      end
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
