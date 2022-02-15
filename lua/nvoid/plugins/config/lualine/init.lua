local config = require("nvoid.core.utils").load_config()

if config.ui.statusline == "nvoid" then
	require("nvoid.plugins.config.lualine.styles.nvoid")
elseif config.ui.statusline == "lunarvim" then
	require("nvoid.plugins.config.lualine.styles.lunarvim")
elseif config.ui.statusline == "nvchad" then
	require("nvoid.plugins.config.lualine.styles.nvchad")
elseif config.ui.statusline == "minimal" then
	require("nvoid.plugins.config.lualine.styles.minimal")
end
