local M = {}

M.lua = function()
  return { settings = { Lua = { diagnostics = { globals = { "vim" } } } } }
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

return M
