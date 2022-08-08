local S = {}
local M = require "nvoid.ui.statusline.modules"

S.run = function()
  return table.concat {
    M.mode(),
    M.fileInfo(),
    M.git(),

    "%=",
    M.lsp_progress(),
    "%=",

    M.diagnostics(),
    M.lsp(),
    M.scrollbar(),
  }
end

return S
