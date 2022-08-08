require "nvoid.core"
require "nvoid.core.options"
require "nvoid.core.map"
require("nvoid.core.packer").load()
pcall(require, "custom.nvoidrc")
vim.opt.statusline = "%!v:lua.require'nvoid.ui.statusline'.run()"
