local config = require('nvoidrc')

if config.ui.statusline == 'nvoid' then
    require("nvoid.plugins.config.lualine.nvoid")
elseif config.ui.statusline == 'vscode' then
    require("nvoid.plugins.config.lualine.vscode")
end
