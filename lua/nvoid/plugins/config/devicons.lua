  local present, devicons = pcall(require, "nvim-web-devicons")
  require("base16").load_highlight("devicons")

  if present then
    local options = { override = require("ui.icons").devicons }
    devicons.setup(options)
  end
