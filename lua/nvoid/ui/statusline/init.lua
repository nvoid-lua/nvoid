local S = {}

local M = require "nvoid.ui.statusline.modules"

S.run = function()
  if nvoid.ui.statusline.style == "nvoid" then
    return table.concat {
      M.modeN(),
      M.fileInfo(),
      -- M.git(),

      "%=",
      M.lsp_progress(),
      "%=",

      M.diagnostics(),
      -- M.lsp(),
      M.scrollbar(),
    }
  elseif nvoid.ui.statusline.style == "minimal" then
    return table.concat {
      M.modeM(),
      -- M.git(),
      " ",
      M.diagnostics(),

      "%=",
      M.lsp_progress(),
      "%=",

      M.fileInfo(),
      M.scrollbar(),
    }
  elseif nvoid.ui.statusline.style == "evil" then
    return table.concat {
      M.modeE(),
      M.fileInfo(),
      -- M.git(),

      "%=",
      M.lsp_progress(),
      "%=",

      M.diagnostics(),
      -- M.lsp(),
      M.scrollbar(),
    }
  end
end

return S
