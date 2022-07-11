local M = {}

require "nvoid.plugins.config.lsp.lsp-installer"
require("nvoid.plugins.config.lsp.handlers").setup()
require "nvoid.plugins.config.lsp.null-ls"

return M
