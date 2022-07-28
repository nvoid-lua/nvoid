local cmd = vim.cmd
-- Nvoid Stuff
cmd [[ command! NvoidUpdater lua _UPDATER() ]]
cmd [[ command! NvoidEditConfig e ~/.config/nvim/lua/custom/nvoidrc.lua ]]
-- Lsp Stuff
cmd [[ command! NvoidRename lua require("nvoid.ui.rename").open() ]]
cmd [[ command! NvoidFormat lua vim.lsp.buf.formatting() ]]
cmd [[ command! NvoidDiagnostics lua vim.diagnostic.open_float(0, { show_header = false, severity_sort = true, scope = "line", }) ]]
