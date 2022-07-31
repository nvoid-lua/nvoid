local present, ts_config = pcall(require, "nvim-treesitter.configs")
local config = require("nvoid.core.utils").load_config()

if not present then
  return
end

ts_config.setup {
  use_languagetree = true,
  on_config_done = nil,
  ensure_installed = config.ts_add,
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "latex" },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      c = "// %s",
    },
  },
  matchup = {
    enable = false,
  },
  indent = { enable = true, disable = { "yaml", "python" } },
  autotag = { enable = false },
  textobjects = {
    swap = {
      enable = false,
    },
    select = {
      enable = false,
    },
  },
  rainbow = {
    enable = false,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
}
