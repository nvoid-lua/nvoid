local M = {}
local config = require("nvoid.core.utils").load_config()
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

if config.lsp.document_highlight then
  M.setup_document_highlight = function(client, bufnr)
    local status_ok, highlight_supported = pcall(function()
      return client.supports_method "textDocument/documentHighlight"
    end)
    if not status_ok or not highlight_supported then
      return
    end
    local augroup_exist, _ = pcall(vim.api.nvim_get_autocmds, {
      group = "lsp_document_highlight",
    })
    if not augroup_exist then
      vim.api.nvim_create_augroup("lsp_document_highlight", {})
    end
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
  M.on_attach = function(client, bufnr)
    if client.name == "tsserver" or client.name == "sumneko_lua" then
      client.resolved_capabilities.document_formatting = false
    end
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_create_augroup("lsp_document_highlight", {})
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = "lsp_document_highlight",
        buffer = 0,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        group = "lsp_document_highlight",
        buffer = 0,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end
end
return M
