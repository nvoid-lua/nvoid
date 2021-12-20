local present, ts_config = pcall(require, "nvim-treesitter.configs")
local config = require('nvoidrc')
if not present then
   return
end

ts_config.setup {
  use_languagetree = true,
  ensure_installed = config.ts_installed,
   highlight = {
      enable = true,
   matchup = {
     enable = true,
     },
   },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  }
}
