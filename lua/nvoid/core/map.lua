local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

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
map("n", "<TAB>", ":BufNext<CR>", opts)
map("n", "<S-TAB>", ":BufPrev<CR>", opts)
map("n", "<S-x>", ":BufClose<CR>", opts)
