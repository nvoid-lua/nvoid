-- statusline
if nvoid.statusline.enabled then
  vim.opt.statusline = nvoid.statusline.config
end

-- Term
vim.schedule_wrap(require("nvoid.builtin.terminal").init())

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local terminal_options = nvoid.terminal

map(
  "n",
  "<A-t>",
  "<cmd>lua require('nvoid.builtin.terminal').new_or_toggle('horizontal', "
    .. tostring(terminal_options.window.split_height)
    .. ")<cr>",
  opts
)

map(
  "t",
  "<A-t>",
  "<cmd>lua require('nvoid.builtin.terminal').new_or_toggle('horizontal', "
    .. tostring(terminal_options.window.split_height)
    .. ")<cr>",
  opts
)
require("nvoid.builtin.winbar")
