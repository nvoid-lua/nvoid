local api = vim.api
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
local opt = vim.opt

-- Fix NvimTree
cmd([[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]])

-- Use 'q' to quit from common plugins
autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]])
  end,
})

-- Remove statusline and tabline when in Alpha
autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    opt.laststatus = 0
    opt.showtabline = 0
  end,
})

autocmd("BufUnload", {
  buffer = 0,
  callback = function()
    opt.laststatus = 3
    opt.showtabline = 2
  end,
})

-- Fixes Autocomment
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Highlight Yanked Text
vim.api.nvim_create_augroup("Highlight", { clear = true })
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=1500, on_visual = true})",
  group = "Highlight",
  desc = "Highlight yanked text",
})

autocmd({ "BufAdd", "BufEnter" }, {
  callback = function(args)
    if vim.t.bufs == nil then
      vim.t.bufs = { args.buf }
    else
      local bufs = vim.t.bufs
      if not vim.tbl_contains(bufs, args.buf) and (args.event == "BufAdd" or vim.bo[args.buf].buflisted) then
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
