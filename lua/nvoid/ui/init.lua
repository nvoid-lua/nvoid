-- statusline
if nvoid.ui.statusline.enabled then
  vim.opt.statusline = nvoid.ui.statusline.config
end

-- Term
vim.schedule_wrap(require("nvoid.ui.terminal").init())

-- Load HL
require "nvoid.ui.base16"
