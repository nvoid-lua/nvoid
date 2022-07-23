local cmd = vim.cmd
-- Nvoid Stuff
cmd [[ command! NvoidUpdater lua _UPDATER() ]]
-- Lsp Stuff
cmd [[ command! NvoidRename lua require("nvoid.ui").rename() ]]
cmd [[ command! NvoidCodeActions lua require("nvoid.ui").code_actions() ]]
cmd [[ command! NvoidRangeCodeActions lua require("nvoid.ui").range_code_actions() ]]
cmd [[ command! NvoidFormat lua vim.lsp.buf.formatting() ]]
cmd [[ command! NvoidDiagnostics lua vim.lsp.diagnostic.show_line_diagnostics() ]]
cmd [[ command! NvoidEditConfig e ~/.config/nvim/lua/custom/nvoidrc.lua ]]
