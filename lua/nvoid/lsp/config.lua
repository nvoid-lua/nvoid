local skipped_servers = {
  "angularls",
  "ansiblels",
  "antlersls",
  "ast_grep",
  "azure_pipelines_ls",
  "basedpyright",
  "biome",
  "bzl",
  "ccls",
  "css_variables",
  "cssmodules_ls",
  "custom_elements_ls",
  "denols",
  "docker_compose_language_service",
  "dprint",
  "elp",
  "ember",
  "emmet_language_server",
  "emmet_ls",
  "eslint",
  "eslintls",
  "fennel_language_server",
  "gitlab_ci_ls",
  "glint",
  "glslls",
  "golangci_lint_ls",
  "gradle_ls",
  "graphql",
  "harper_ls",
  "hdl_checker",
  "hydra_lsp",
  "htmx",
  "java_language_server",
  "jedi_language_server",
  "lexical",
  "ltex",
  "lwc_ls",
  "mdx_analyzer",
  "neocmake",
  "nim_langserver",
  "ocamlls",
  "omnisharp",
  "phpactor",
  "psalm",
  "pylsp",
  "pylyzer",
  "pyre",
  "quick_lint_js",
  "reason_ls",
  "rnix",
  "rome",
  "rubocop",
  "ruby_ls",
  "ruby_lsp",
  "ruff_lsp",
  "scry",
  "snyk_ls",
  "solang",
  "solc",
  "solidity_ls",
  "solidity_ls_nomicfoundation",
  "sorbet",
  "sourcekit",
  "somesass_ls",
  "sourcery",
  "spectral",
  "sqlls",
  "sqls",
  "standardrb",
  "stimulus_ls",
  "stylelint_lsp",
  "svlangserver",
  "swift_mesonls",
  "templ",
  "tflint",
  "tinymist",
  "unocss",
  "vale_ls",
  "vacuum",
  "verible",
  "v_analyzer",
  "vtsls",
  "vuels",
}

local skipped_filetypes = { "markdown", "rst", "plaintext", "toml", "proto" }

local join_paths = require("nvoid.utils").join_paths

return {
  templates_dir = join_paths(get_runtime_dir(), "site", "after", "ftplugin"),
  ---@deprecated use vim.diagnostic.config({ ... }) instead
  diagnostics = {},
  document_highlight = false,
  code_lens_refresh = true,
  on_attach_callback = nil,
  on_init_callback = nil,
  automatic_configuration = {
    ---@usage list of servers that the automatic installer will skip
    skipped_servers = skipped_servers,
    ---@usage list of filetypes that the automatic installer will skip
    skipped_filetypes = skipped_filetypes,
  },
  buffer_mappings = {
    normal_mode = {
      ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
      ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
      ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
      ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references" },
      ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
      ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },
      ["gl"] = {
        function()
          local float = vim.diagnostic.config().float

          if float then
            local config = type(float) == "table" and float or {}
            config.scope = "line"

            vim.diagnostic.open_float(config)
          end
        end,
        "Show line diagnostics",
      },
    },
    insert_mode = {},
    visual_mode = {},
  },
  buffer_options = {
    --- enable completion triggered by <c-x><c-o>
    omnifunc = "v:lua.vim.lsp.omnifunc",
    --- use gq for formatting
    formatexpr = "v:lua.vim.lsp.formatexpr(#{timeout_ms:500})",
  },
  ---@usage list of settings of nvim-lsp-installer
  installer = {
    setup = {
      ensure_installed = {},
      automatic_installation = {
        exclude = {},
      },
    },
  },
  nlsp_settings = {
    setup = {
      config_home = join_paths(get_config_dir(), "lsp-settings"),
      -- set to false to overwrite schemastore.nvim
      append_default_schemas = true,
      ignored_servers = {},
      loader = "json",
    },
  },
  null_ls = {
    setup = {
      debug = false,
    },
    config = {},
  },
  ---@deprecated use nvoid.lsp.automatic_configuration.skipped_servers instead
  override = {},
  ---@deprecated use nvoid.lsp.installer.setup.automatic_installation instead
  automatic_servers_installation = nil,
}
