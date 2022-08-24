local present, devicons = pcall(require, "nvim-web-devicons")

if present then
  local options = { override = require("nvoid.ui.icons").devicons }
  devicons.setup(options)
end
