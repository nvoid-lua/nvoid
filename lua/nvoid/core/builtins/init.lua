local M = {}

local builtins = {
  "nvoid.plugins.config.cmp",
  "nvoid.plugins.config.which-key",
  "nvoid.plugins.config.gitsigns",
  "nvoid.plugins.config.telescope",
  "nvoid.plugins.config.treesitter",
  "nvoid.plugins.config.nvimtree",
  "nvoid.plugins.config.autopairs",
  "nvoid.plugins.config.notify",
  "nvoid.plugins.config.mason",
  "nvoid.plugins.config.illuminate",
}

function M.config(config)
  for _, builtin_path in ipairs(builtins) do
    local builtin = require(builtin_path)
    builtin.config(config)
  end
end

return M
