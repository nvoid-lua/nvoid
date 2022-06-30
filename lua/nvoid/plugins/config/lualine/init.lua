local config = require("nvoid.core.utils").load_config()

if config.ui.statusline == "nvoid" then
  require "nvoid.plugins.config.lualine.styles.nvoid"
elseif config.ui.statusline == "evil" then
  require "nvoid.plugins.config.lualine.styles.evil"
elseif config.ui.statusline == "minimal" then
  require "nvoid.plugins.config.lualine.styles.minimal"
elseif config.ui.statusline == "default" then
  require "nvoid.plugins.config.lualine.styles.default"
end
