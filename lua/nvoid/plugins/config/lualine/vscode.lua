-- Diff Source
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
-- LuaLine
local present1, lualine = require 'lualine'
if not present1 then
   return false
end
-- Colors
local present2,colors = pcall(require, "nvoid.colors")
if not present2 then
   return false
end
-- Config
local config = {
  options = {
    component_separators = '',
    section_separators = '',
	disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.blue_dark } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}
-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end
-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end
-- LEFT
ins_left {
	"branch",
	icons_enabled = true,
	icon = "",
}
ins_left {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}
ins_left {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

ins_right {
	"diff",
    source = diff_source,
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}
ins_right {
	"location",
	padding = 1,
}
ins_right{
function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
}
ins_right {
  "encoding"
}
ins_right {
  	"filetype",
	icons_enabled = false,
	icon = nil,
}
ins_right {
    function()
      local current_line = vim.fn.line "."
      local total_lines = vim.fn.line "$"
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 0, right = 0 },
    color = { fg = colors.white, bg = colors.blue_dark },
    cond = nil,
}

lualine.setup(config)
