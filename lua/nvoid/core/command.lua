local M = {}

local api = vim.api
local autocmd = vim.api.nvim_create_autocmd

M.autocmd = function()
  vim.cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

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
  autocmd("FileType", {
    pattern = "alpha",
    callback = function()
      vim.opt.showtabline = 0
      vim.opt.laststatus = 0
    end,
  })

  autocmd("BufUnload", {
    buffer = 0,
    callback = function()
      vim.opt.showtabline = 2
      vim.opt.laststatus = 3
    end,
  })

  -- Fixes Autocomment
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

  autocmd({ "BufAdd" }, {
    callback = function(args)
      if vim.t.bufs == nil then
        vim.t.bufs = { args.buf }
      else
        local bufs = vim.t.bufs

        -- check for duplicates
        if not vim.tbl_contains(bufs, args.buf) then
          table.insert(bufs, args.buf)
          vim.t.bufs = bufs
        end
      end
    end,
  })

  autocmd("BufDelete", {
    callback = function(args)
      for _, tab in ipairs(api.nvim_list_tabpages()) do
        local bufs = vim.t[tab].bufs
        if bufs then
          for i, bufnr in ipairs(bufs) do
            if bufnr == args.buf then
              table.remove(bufs, i)
              vim.t[tab].bufs = bufs
              break
            end
          end
        end
      end
    end,
  })
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
