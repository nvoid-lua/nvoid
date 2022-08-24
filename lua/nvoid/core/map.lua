local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local utils = require("nvoid.core.utils")
local config = utils.load_config()
local terminal_options = config.plugins.terminal

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-Up>", ":resize -1<CR>", opts)
map("n", "<C-Down>", ":resize +1<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Float Term
map("n", "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
map("t", "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
-- Term
map(
  "n",
  "<A-t>",
  "<cmd>lua require('nvoid.core.terminal').new_or_toggle('horizontal', "
    .. tostring(terminal_options.window.split_height)
    .. ")<cr>",
  opts
)

map(
  "t",
  "<A-t>",
  "<cmd>lua require('nvoid.core.terminal').new_or_toggle('horizontal', "
    .. tostring(terminal_options.window.split_height)
    .. ")<cr>",
  opts
)

if require("nvoid.core.utils").load_config().ui.bufferline.enabled then
  map("n", "<TAB>", ":BufNext<CR>", opts)
  map("n", "<S-TAB>", ":BufPrev<CR>", opts)
  map("n", "<S-x>", ":BufClose<CR>", opts)
end

