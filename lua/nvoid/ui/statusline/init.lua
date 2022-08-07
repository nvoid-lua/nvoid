local module = require "nvoid.ui.statusline.modules"
local M = {}

M.run = function()
  return table.concat {
    module.mode(),
    module.fileInfo(),
    module.git(),

    "%=",
    module.lsp_progress(),
    "%=",

    module.diagnostics(),
    module.lsp(),
    module.scrollbar(),
  }
end

return M
