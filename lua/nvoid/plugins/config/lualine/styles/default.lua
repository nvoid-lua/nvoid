-- Lualine
local present1, lualine = pcall(require, "lualine")
if not present1 then
  return false
end

-- Color
local colors = require("nvoid.colors").get()

-- diff_source
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

--dif
local diff = {
  "diff",
  source = diff_source(),
  symbols = { added = "  ", modified = "柳", removed = " " },
  diff_color = {
    added = { bg = colors.statusline_bg, fg = colors.green },
    modified = { bg = colors.statusline_bg, fg = colors.yellow },
    removed = { bg = colors.statusline_bg, fg = colors.red },
  },
  color = {},
  cond = nil,
}

-- Gps
local gps = require "nvim-gps"

-- Config
lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = require("nvoid.plugins.config.lualine.theme").def(),
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", diff, "diagnostics" },
    lualine_c = {
      "filename",
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
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
