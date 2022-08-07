local present, ts_config = pcall(require, "nvim-treesitter.configs")
local config = require("nvoid.core.utils").load_config()

if not present then
  return
end

ts_config.setup {
  ensure_installed = config.ts_add,
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  matchup = {
    enable = true,
  },
  indent = { enable = true },
}
