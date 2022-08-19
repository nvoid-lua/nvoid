local M = {}
local lsp_config = require("nvoid.core.utils").load_config()
require("base16").load_highlight("lsp")

M.AutoForamt = function()
  if lsp_config.lsp.autoforamt then
    local cmd = vim.cmd
    cmd([[
    augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> NvoidFormat
    augroup END
  ]])
  end
end

if lsp_config.lsp.document_highlight then
  M.setup_document_highlight = function(client, bufnr)
    local status_ok, highlight_supported = pcall(function()
      return client.supports_method("textDocument/documentHighlight")
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
  M.on_attach = function(client)
    if vim.g.vim_version > 7 then
      if client.server_capabilities.documentHighlightProvider then
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
    else
      if client.resolved_capabilities.document_highlight then
        if client.name == "tsserver" or client.name == "sumneko_lua" then
          client.resolved_capabilities.document_formatting = false
        end
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
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

return M
