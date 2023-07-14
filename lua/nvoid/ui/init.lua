-- statusline
if nvoid.ui.statusline.enabled then
  dofile(vim.g.base16_cache .. "statusline")
  vim.opt.statusline = nvoid.ui.statusline.config
end

-- Term
vim.schedule_wrap(require("nvoid.ui.terminal").init())

-- Winbar
if nvoid.ui.winbar then
  dofile(vim.g.base16_cache .. "navic")
  require "nvoid.ui.winbar"
end
