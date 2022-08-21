local M = {}

require("nvoid.plugins.config.lsp.mason")
require("nvoid.plugins.config.lsp.config").diagnostics_signs()
require("nvoid.plugins.config.lsp.config").diagnostics()
require("nvoid.plugins.config.lsp.config").AutoForamt()

return M
