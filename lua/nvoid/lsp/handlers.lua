-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
local M = {}

function M.setup()
  local config = { -- your config
    virtual_text = nvoid.lsp.diagnostics.virtual_text,
    signs = nvoid.lsp.diagnostics.signs,
    underline = nvoid.lsp.diagnostics.underline,
    update_in_insert = nvoid.lsp.diagnostics.update_in_insert,
    severity_sort = nvoid.lsp.diagnostics.severity_sort,
    float = nvoid.lsp.diagnostics.float,
  }
  vim.diagnostic.config(config)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, nvoid.lsp.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, nvoid.lsp.float)
end

return M
