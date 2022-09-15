local merge_tb = require("nvoid.builtin.base16").merge_tb

local highlights = {}
local hl_dir = vim.fn.stdpath "config" .. "/lua/nvoid/builtin/base16/highlight"

-- push hl_dir file names to table
local hl_files = require("plenary.scandir").scan_dir(hl_dir, {})

for _, file in ipairs(hl_files) do
  local a = vim.fn.fnamemodify(file, ":t")
  a = vim.fn.fnamemodify(a, ":r")

  local integration = require("nvoid.builtin.base16.highlight." .. a)
  highlights = merge_tb(highlights, integration)
end

-- polish theme specific highlights
local polish_hl = require("nvoid.builtin.base16").get_theme_tb "polish_hl"

if polish_hl then
  highlights = merge_tb(highlights, polish_hl)
end

if vim.g.transparency then
  highlights = merge_tb(highlights, require "nvoid.builtin.base16.glassy")
end

return highlights
