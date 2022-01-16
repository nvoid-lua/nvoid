local key_map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

key_map("n", "<C-h>", "<C-w>h", opts)
key_map("n", "<C-j>", "<C-w>j", opts)
key_map("n", "<C-k>", "<C-w>k", opts)
key_map("n", "<C-l>", "<C-w>l", opts)
key_map("n", "<C-Up>", ":resize -2<CR>", opts)
key_map("n", "<C-Down>", ":resize +2<CR>", opts)
key_map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
key_map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
key_map("n", "<C-q>", ":q<CR>", opts)
key_map("n", "<C-s>", ":w<CR>", opts)
key_map("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
key_map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
key_map("n", "<S-x>", ":Bdelete this<CR>", opts)
