return {
  run = function()
    local M = require "nvoid.builtin.bufferline.modules"
    return M.CoverNvimTree() .. M.bufferlist() .. (M.tablist() or "") .. M.buttons()
  end,
}