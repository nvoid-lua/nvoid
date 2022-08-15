local M = {}

require "nvoid.plugins.config.lsp.lsp-installer"
require("nvoid.plugins.config.lsp.config").setup()
require("nvoid.plugins.config.lsp.config").AutoForamt()
require "nvoid.plugins.config.lsp.null-ls"

return M
