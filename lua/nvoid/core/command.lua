local M = {}
M.autocmd = function()
  local autocmd = vim.api.nvim_create_autocmd

  -- Remove statusline and tabline when in Alpha
  autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.opt.showtabline = 0
      vim.opt.laststatus = 0
    end,
  })

  -- Disable Auto Commenting on new line
  autocmd("BufEnter", {
    pattern = "*",
    command = "set fo-=c fo-=r fo-=o",
  })

  -- Highlight Yanked Text
  autocmd({ "TextYankPost" }, {
    callback = function()
      vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
    end,
  })
  vim.opt.statusline = "%!v:lua.require'nvoid.ui.statusline'.run()"
end

M.cmd = function()
  local cmd = vim.cmd
  -- Nvoid Stuff
  cmd [[ command! NvoidUpdater lua _UPDATER() ]]
  cmd [[ command! NvoidEditConfig e ~/.config/nvim/lua/custom/nvoidrc.lua ]]
  -- Lsp Stuff
  cmd [[ command! NvoidRename lua require("nvoid.ui.rename").open() ]]
  cmd [[ command! NvoidFormat lua vim.lsp.buf.formatting() ]]
  cmd [[ command! NvoidDiagnostics lua vim.diagnostic.open_float(0, { show_header = false, severity_sort = true, scope = "line", }) ]]
  -- Comment
  cmd [[ command! NvoidComment lua require('Comment.api').toggle_current_linewise() ]]
  cmd [[ command! NvoidCommentV lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode()) ]]
end

return M
