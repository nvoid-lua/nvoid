local M = {}

M.init = function(theme)
  if not theme then
    theme = require("nvoid.core.utils").load_config().ui.theme
  end
  vim.g.theme = require("nvoid.core.utils").load_config().ui.theme
  local present, base16 = pcall(require, "base16")
  if present then
    base16(base16.themes(theme), true)
    package.loaded["nvoid.colors.highlights" or false] = nil
    require "nvoid.colors.highlights"
  end
end

M.get = function()
  local theme = require("nvoid.core.utils").load_config().ui.theme
  return require("nvoid.colors.hl_themes." .. theme)
end

return M
