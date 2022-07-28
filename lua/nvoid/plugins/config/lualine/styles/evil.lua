-- LuaLine
local _lualine, lualine = pcall(require, "lualine")
if not _lualine then
  return
end

-- components
local component = require "nvoid.plugins.config.lualine.components"

-- Config
lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = require("nvoid.plugins.config.lualine.theme").other(),
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { component.mode_evil },
    lualine_b = { component.branch, component.filename },
    lualine_c = { component.diff },
    lualine_x = {
      component.treesitter,
      component.diagnostics,
      component.lsp,
      component.filetype,
    },
    lualine_y = {},
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
