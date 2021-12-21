local config = require("nvoid.core.utils").load_config()

if config.ui.statusline == 'nvoid' then
    require("nvoid.plugins.config.lualine.nvoid")
elseif config.ui.statusline == 'vscode' then
    require("nvoid.plugins.config.lualine.vscode")
end
