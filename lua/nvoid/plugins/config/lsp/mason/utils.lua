local M = {}
local config = require("nvoid.core.utils").load_config()
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
  return
end

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

if config.lsp.document_highlight then
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
  M.on_attach = function(client, bufnr)
    attach_navic(client, bufnr)
      if client.server_capabilities.documentHighlightProvider then
        vim.cmd([[
          augroup document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]])
      end
  end
end

return M
