local B = {}

local M = require "nvoid.ui.bufferline.modules"

B.run = function()
  return M.CoverNvimTree() .. M.bufferlist() .. (M.tablist() or "") .. M.buttons()
end

return B
