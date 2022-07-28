-- LuaLine
local _lualine, lualine = pcall(require, "lualine")
if not _lualine then
  return
end

-- components
local theme = require("base16.highlights.lualine").other()
local colors = require("base16").get()
local yellow = colors.yellow
local component = require "nvoid.plugins.config.lualine.components"

-- Config
lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { component.mode_nvoid },
    lualine_b = { component.filename },
    lualine_c = {
      { "branch", color = { fg = yellow } },
      component.diff,
    },
    lualine_x = { component.lsp, component.diagnostics },
    lualine_y = { component.filetype },
    lualine_z = { component.scrollbar },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
