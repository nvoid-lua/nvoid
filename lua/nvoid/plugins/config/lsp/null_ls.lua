local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end
local builtins = null_ls.builtins
local sources = {
  builtins.formatting.stylua,
  builtins.formatting.black.with({ extra_args = { "--fast" } }),
  builtins.diagnostics.flake8,
}

null_ls.setup({
  debug = true,
  sources = sources,
  on_attach = function()
    vim.cmd([[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end,
})
