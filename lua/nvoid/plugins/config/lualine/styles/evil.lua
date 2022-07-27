-- LuaLine
local _lualine, lualine = pcall(require, "lualine")
if not _lualine then
  return
end

-- Colors
local colors = require("base16").get()

-- components
local component = require "nvoid.plugins.config.lualine.components"

-- Mode
local mode = {
  function()
    local mode_color = {
      n = colors.nord_blue,
      i = colors.green,
      v = colors.purple,
      [""] = colors.purple,
      V = colors.purple,
      c = colors.yellow,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.pink,
      Rv = colors.pink,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    vim.api.nvim_command("hi! LualineMode guibg=" .. mode_color[vim.fn.mode()] .. " guifg=" .. colors.statusline_bg)
    return " "
  end,
  color = "LualineMode",
  padding = { right = 0 },
}

-- Config
lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = require("nvoid.plugins.config.lualine.theme").min(),
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
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
