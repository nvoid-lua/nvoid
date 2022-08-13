-- local present, ts_config = pcall(require, "nvim-treesitter.configs")
local config = require("nvoid.core.utils").load_config()

-- if not present then
--   return
-- end

-- require("base46").load_highlight "syntax"
-- require("base46").load_highlight "treesitter"

-- ts_config.setup {
--   ensure_installed = config.ts_add,
--   auto_install = true,
--   highlight = {
--     enable = true,
--     use_languagetree = true,
--   },
--   matchup = {
--     enable = true,
--   },
--   indent = { enable = true },
-- }

local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("base46").load_highlight "syntax"
require("base46").load_highlight "treesitter"

local options = {
  ensure_installed = config.ts_add,
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  matchup = {
    enable = true,
  },
  indent = { enable = true },
}

treesitter.setup(options)
