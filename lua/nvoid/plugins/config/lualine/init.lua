local config = require("nvoid.core.utils").load_config()

if config.ui.statusline == "nvoid" then
	require("nvoid.plugins.config.lualine.styles.nvoid")
elseif config.ui.statusline == "vscode" then
	require("nvoid.plugins.config.lualine.style.vscode")
elseif config.ui.statusline == "lunarvim" then
	require("nvoid.plugins.config.lualine.lunarvim")
elseif config.ui.statusline == "nvchad" then
	require("nvoid.plugins.config.lualine.styles.nvchad")
end
