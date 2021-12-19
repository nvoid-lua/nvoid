vim.cmd("let g:matchup_matchparen_offscreen = {'method': 'popup'}")
vim.cmd("set shortmess+=c")
vim.cmd("let g:loaded_matchit = 1")
vim.opt.history = 100
vim.opt.synmaxcol = 240
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.pumheight = 10
vim.opt.timeoutlen = 150
vim.opt.completeopt = "menuone,noselect"
vim.g.loaded_matchit = 1
vim.g.matchup_delim_stopline = 1500
vim.g.matchup_matchparen_stopline = 400
require("nvoid.core.key-map")
require("nvoid.core.autocmd")
