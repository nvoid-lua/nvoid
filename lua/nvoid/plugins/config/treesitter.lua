local M = {}
local Log = require "nvoid.core.log"

function M.config()
  nvoid.builtin.treesitter = {
    on_config_done = nil,
    ensure_installed = { "comment", "markdown_inline", "regex" },
    ignore_install = {},
    parser_install_dir = nil,
    sync_install = false,
    auto_install = true,
    matchup = {
      enable = false,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(lang, buf)
        if vim.tbl_contains({ "latex" }, lang) then
          return true
        end

        local status_ok, big_file_detected = pcall(vim.api.nvim_buf_get_var, buf, "bigfile_disable_treesitter")
        return status_ok and big_file_detected
      end,
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
        json = "",
      },
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
    textsubjects = {
      enable = false,
      keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
    },
    playground = {
      enable = false,
      disable = {},
      updatetime = 25,
      persist_queries = false,
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    rainbow = {
      enable = false,
      extended_mode = true,
      max_file_lines = 1000,
    },
  }
end

function M.setup()
  if #vim.api.nvim_list_uis() == 0 then
    Log:debug "headless mode detected, skipping running setup for treesitter"
    return
  end

  local ts_status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not ts_status_ok then
    Log:error "Failed to load nvim-treesitter.configs"
    return
  end

  local status_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring")
  if not status_ok then
    Log:error "Failed to load ts_context_commentstring"
    return
  end

  local opts = vim.deepcopy(nvoid.builtin.treesitter)

  ts_context_commentstring.setup(opts.context_commentstring)
  opts.context_commentstring = nil

  treesitter_configs.setup(opts)

  if nvoid.builtin.treesitter.on_config_done then
    nvoid.builtin.treesitter.on_config_done(treesitter_configs)
  end

  local ts_utils = require "nvim-treesitter.ts_utils"
  ts_utils.is_in_node_range = vim.treesitter.is_in_node_range
  ts_utils.get_node_range = vim.treesitter.get_node_range
end

return M
