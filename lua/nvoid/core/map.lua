local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- { Window controls
map('n', '<C-h>', '<C-w>h', {silent = true})
map('n', '<C-j>', '<C-w>j', {silent = true})
map('n', '<C-k>', '<C-w>k', {silent = true})
map('n', '<C-l>', '<C-w>l', {silent = true})
-- }

-- { Window resizing
map('n', '<C-Up>', ':resize -2<CR>', {silent = true})
map('n', '<C-Down>', ':resize +2<CR>', {silent = true})
map('n', '<C-Left>', ':vertical resize -2<CR>', {silent = true})
map('n', '<C-Right>', ':vertical resize +2<CR>', {silent = true})
-- }

-- { Buffers
map('n', '<TAB>',   ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', '<S-x>',   ':Bdelete this<CR>', { noremap = true, silent = true })
map('n', '<leader>bj', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
map('n', '<leader>bk', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', '<leader>bn', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
map('n', '<leader>bn', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
map('n', '<leader>bc', ':Bdelete this<CR>', { noremap = true, silent = true })
-- }

-- { FileManagers
map('n', '<leader>e', ':NvimTreeToggle<CR>', default_opts)
-- }

-- { Edit config
map('n', '<leader>E', ':e ~/.config/nvim/lua/nvoidrc.lua<CR>', default_opts)
-- }

-- { Write
map('n', '<leader>m', ':messages<CR>', default_opts)
map('n', '<leader>w', ':w<CR>', default_opts)
map('n', '<leader>x', ':wqa!<CR>', default_opts)
-- }

-- { Dashboard
map('n', '<leader>d',  ':Dashboard<CR>', default_opts)
map('n', '<leader>fh', ':Telescope oldfiles<CR>', default_opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', default_opts)
map('n', '<leader>fc', ':Telescope colorscheme<CR>', default_opts)
map('n', '<leader>fn', ':enew<CR>', default_opts)
-- }

-- { Sessions
map('n', '<leader>ss', ':SessionSave<CR>', default_opts)
map('n', '<leader>sl', ':SessionLoad<CR>', default_opts)
-- }

-- { Lsp
map('n', '<leader>ld', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', default_opts)
map('n', '<leader>lt', ':TroubleToggle document_diagnostics<CR>', default_opts)
map('n', '<leader>lT', ':TroubleToggle<CR>', default_opts)
map('n', '<leader>lh', ':lua vim.lsp.buf.document_highlight()<CR>', default_opts)
map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', default_opts)
map('n', '<leader>lI', ':LspInstallInfo<CR>', default_opts)
map('n', '<leader>li', ':LspInfo<CR>', default_opts)
map('n', '<leader>lD', ':Telescope lsp_document_diagnostics<CR>', default_opts)
map('n', '<leader>lc', ':! rm -f config.h && sudo make clean install<CR><CR>', default_opts)
-- }

-- { Term
map('n', '<leader>ts', ':ToggleTerm size=12 direction=horizontal<CR>', default_opts)
map('n', '<leader>tt', ':ToggleTerm<CR>', default_opts)
map("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", default_opts)
map("n", "<leader>th", "<cmd>lua _htop_toggle()<CR>", default_opts)
map("n", "<leader>tp", "<cmd>lua _python_toggle()<CR>", default_opts)
map("n", "<leader>tn", "<cmd>lua _ncdu_toggle()<CR>", default_opts)
-- }

-- { GIT
map('n', '<leader>gj', ":lua require 'gitsigns'.next_hunk()<CR>", default_opts)
map('n', '<leader>gg', ":Gitsigns toggle_signs<CR>", default_opts)
map('n', '<leader>gk', ":lua require 'gitsigns'.prev_hunk()<CR>", default_opts)
map('n', '<leader>gS', ":lua require'gitsigns'.stage_hunk()<CR>", default_opts)
map('n', '<leader>gS', ":lua require'gitsigns'.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", default_opts)
map('n', '<leader>gU', ":lua require'gitsigns'.undo_stage_hunk():<CR>", default_opts)
map('n', '<leader>gs', ":Telescope git_status<CR>", default_opts)
map('n', '<leader>gc', ":Telescope git_commits<CR>", default_opts)
-- }

-- { Packer
map('n', '<leader>pi', ":PackerInstall<CR>", default_opts)
map('n', '<leader>pc', ":PackerClean<CR>", default_opts)
map('n', '<leader>ps', ":PackerSync<CR>", default_opts)
map('n', '<leader>pS', ":PackerStatus<CR>", default_opts)
map('n', '<leader>pC', ":PackerCompile<CR>", default_opts)
-- }
