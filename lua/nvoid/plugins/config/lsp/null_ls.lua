local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end
local builtins = null_ls.builtins
local sources = {
  builtins.formatting.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
}

