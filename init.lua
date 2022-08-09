require("nvoid.core.command").autocmd()
require("nvoid.core.command").cmd()
require "nvoid.core.options"
require "nvoid.core.map"
require("nvoid.core.packer").load()
pcall(require, "custom.nvoidrc")
