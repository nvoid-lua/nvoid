vim.opt.termguicolors = true
vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
  augroup _dashboard
    autocmd!
    autocmd FileType dashboard setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= 
    autocmd FileType dashboard set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2
    autocmd FileType dashboard nnoremap <silent> <buffer> q :q<CR>
    autocmd FileType dashboard nnoremap <silent> <buffer> e :e ~/.config/nvim/lua/custom/nvoidrc.lua<CR>
    autocmd FileType dashboard nnoremap <silent> <buffer> f :Telescope find_files<CR>
  augroup end
  augroup LspFormatting
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
  augroup END
]])
