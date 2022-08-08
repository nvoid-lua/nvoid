local M = {}
M.autocmd = function()
  vim.cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
  local autocmd = vim.api.nvim_create_autocmd

  -- Use 'q' to quit from common plugins
  autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
    callback = function()
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
    end,
  })

  -- Remove statusline and tabline when in Alpha
  autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
    end,
  })

  -- Fixes Autocomment
  autocmd({ "BufWinEnter" }, {
    callback = function()
      vim.cmd "set formatoptions-=cro"
    end,
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
