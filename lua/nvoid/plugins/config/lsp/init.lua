local M = {}

require("nvoid.plugins.config.lsp.lsp-installer")
require("nvoid.plugins.config.lsp.diagnostics")
require("nvoid.plugins.config.lsp.config").AutoForamt()

return M
