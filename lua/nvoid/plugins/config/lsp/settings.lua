local M = {}
M.lua = function()
  return { settings = { Lua = { diagnostics = { globals = { "vim" }, }, }, }, }
end
M.json = function()
  return {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
      },
    },
    setup = {
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
          end,
        },
      },
    },
  }
end

M.yaml = function()
  return {
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemas = {
          kubernetes = {
            "daemon.{yml,yaml}",
            "manager.{yml,yaml}",
            "restapi.{yml,yaml}",
            "role.{yml,yaml}",
            "role_binding.{yml,yaml}",
            "*onfigma*.{yml,yaml}",
            "*ngres*.{yml,yaml}",
            "*ecre*.{yml,yaml}",
            "*eployment*.{yml,yaml}",
            "*ervic*.{yml,yaml}",
            "kubectl-edit*.yaml",
          },
        },
      },
    },
  }
end
return M
