local config = require("nvoid.core.utils").load_config()

if config.ui.statusline == "nvoid" then
	require("nvoid.plugins.config.lualine.nvoid")
elseif config.ui.statusline == "vscode" then
	require("nvoid.plugins.config.lualine.vscode")
elseif config.ui.statusline == "lunarvim" then
	require("nvoid.plugins.config.lualine.lunarvim")
elseif config.ui.statusline == "bubbles" then
	require("nvoid.plugins.config.lualine.bubbles")
elseif config.ui.statusline == "nvchad" then
	require("nvoid.plugins.config.lualine.nvchad")
end
