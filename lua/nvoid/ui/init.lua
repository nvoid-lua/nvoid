-- statusline
if nvoid.ui.statusline.enabled then
  vim.opt.statusline = nvoid.ui.statusline.config
end

-- Term
vim.schedule_wrap(require("nvoid.ui.terminal").init())

-- Winbar
if nvoid.ui.winbar then
  require "nvoid.ui.winbar"
end

dofile(vim.g.base16_cache .. "defaults")
dofile(vim.g.base16_cache .. "cmp")
dofile(vim.g.base16_cache .. "lsp")
dofile(vim.g.base16_cache .. "devicons")
dofile(vim.g.base16_cache .. "blankline")
dofile(vim.g.base16_cache .. "syntax")
dofile(vim.g.base16_cache .. "git")
dofile(vim.g.base16_cache .. "nvimtree")
dofile(vim.g.base16_cache .. "telescope")
dofile(vim.g.base16_cache .. "whichkey")
dofile(vim.g.base16_cache .. "statusline")
dofile(vim.g.base16_cache .. "bufferline")
dofile(vim.g.base16_cache .. "navic")
