local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
require("nvoid.plugins.config.lsp.lsp-installer")
require("nvoid.plugins.config.lsp.settings")
require("nvoid.plugins.config.lsp.snip")
require("nvoid.plugins.config.lsp.handlers").setup()
