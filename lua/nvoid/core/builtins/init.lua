local M = {}

local builtins = {
  "nvoid.plugins.config.which-key",
  "nvoid.plugins.config.bufferline",
  "nvoid.plugins.config.toggleterm",
  "nvoid.plugins.config.gitsigns",
  "nvoid.plugins.config.cmp",
  "nvoid.plugins.config.telescope",
  "nvoid.plugins.config.treesitter",
  "nvoid.plugins.config.nvimtree",
  "nvoid.plugins.config.illuminate",
  "nvoid.plugins.config.indentlines",
  "nvoid.plugins.config.autopairs",
  "nvoid.plugins.config.comment",
  "nvoid.plugins.config.dap",
  "nvoid.plugins.config.alpha",
  "nvoid.plugins.config.mason",
  "nvoid.plugins.config.navic",
}

function M.config(config)
  for _, builtin_path in ipairs(builtins) do
    local builtin = reload(builtin_path)

    builtin.config(config)
  end
end
require "nvoid.plugins.config.toggleterm"

return M
