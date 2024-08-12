local M = {}

local base_path = "nvoid.plugins.config."
local plugins = {
  "which-key",
  "bufferline",
  "toggleterm",
  "gitsigns",
  "cmp",
  "telescope",
  "treesitter",
  "nvimtree",
  "illuminate",
  "indentlines",
  "autopairs",
  "comment",
  "dap",
  "alpha",
  "mason",
  "navic",
}

local builtins = {}
for _, plugin in ipairs(plugins) do
  table.insert(builtins, base_path .. plugin)
end

-- Function to reload a module safely
local function safe_reload(module_path)
  local success, module = pcall(require, module_path)
  if not success then
    vim.api.nvim_err_writeln("Failed to load module: " .. module_path)
    return nil
  end
  return module
end

function M.config(config)
  for _, builtin_path in ipairs(builtins) do
    local builtin = safe_reload(builtin_path)
    if builtin and builtin.config then
      builtin.config(config)
    end
  end
end

require "nvoid.plugins.config.toggleterm"

return M
