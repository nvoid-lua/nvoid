local present, ts_config = pcall(require, "nvim-treesitter.configs")
local config = require('nv-config')
if not present then
   return
end

ts_config.setup {
  use_languagetree = true,
  ensure_installed = config.ts_installed,
   highlight = {
      enable = true,
   matchup = {
     enable = true,              -- mandatory, false will disable the whole extension
     },
   },
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  }
}