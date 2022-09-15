local config = require("nvoid.core.utils").load_config()
------ impatient ------
vim.defer_fn(function()
  require("nvoid.builtin.impatient")
end, 0)

------ terminal ------
vim.schedule_wrap(require("nvoid.builtin.terminal").init())

------ base16 ------
vim.g.theme = config.ui.theme
vim.g.transparency = config.ui.transparency
require("nvoid.builtin.base16").load_theme()
