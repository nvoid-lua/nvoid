local config = require("nvoid.core.utils").load_config()
local present, ui = pcall(require, "ui")
if not present then
  return
end
ui.setup {
  statusline = {
    enable = config.ui.statusline.enable,
    style = config.ui.statusline.style,
  },
}
