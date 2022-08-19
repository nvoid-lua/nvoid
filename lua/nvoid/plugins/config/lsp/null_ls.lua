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
})
