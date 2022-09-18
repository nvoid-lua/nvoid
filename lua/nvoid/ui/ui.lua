local config = require("nvoid.core.utils").load_config()
local opt = vim.opt
if config.ui.statusline.enabled then
  opt.statusline = config.ui.statusline.config
end
