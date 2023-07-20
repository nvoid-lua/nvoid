dofile(vim.g.base16_cache .. "defaults")
dofile(vim.g.base16_cache .. "syntax")
dofile(vim.g.base16_cache .. "lsp")
dofile(vim.g.base16_cache .. "cmp")

if nvoid.ui.statusline.enabled then
  dofile(vim.g.base16_cache .. "statusline")
end

if nvoid.builtin.winbar.active then
  dofile(vim.g.base16_cache .. "navic")
end

if nvoid.builtin.alpha.active then
  dofile(vim.g.base16_cache .. "alpha")
end

if nvoid.builtin.nvimtree.active then
  dofile(vim.g.base16_cache .. "nvimtree")
end

if nvoid.builtin.gitsigns.active then
  dofile(vim.g.base16_cache .. "git")
end

if nvoid.builtin.telescope.active then
  dofile(vim.g.base16_cache .. "telescope")
end

if nvoid.use_icons then
  dofile(vim.g.base16_cache .. "devicons")
end

if nvoid.builtin.indentlines.active then
  dofile(vim.g.base16_cache .. "blankline")
end

if nvoid.builtin.which_key.active then
  dofile(vim.g.base16_cache .. "whichkey")
end

if nvoid.builtin.bufferline.active then
  dofile(vim.g.base16_cache .. "bufferline")
end
