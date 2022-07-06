local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    diagnostics.flake8,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()"
    end
    vim.cmd [[
  augroup document_highlight
  autocmd! * <buffer>
  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  augroup END
  ]]
  end,
}
