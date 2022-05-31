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

-- Gps
local gps = require "nvim-gps"

-- LuaLine
local present1, lualine = pcall(require, "lualine")
if not present1 then
  return false
end

-- Colors
local colors = require("nvoid.colors").get()

-- Config
local config = {
  options = {
    component_separators = "",
    section_separators = "",
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.statusline_bg } },
      inactive = {
        a = { bg = colors.black, fg = colors.white, gui = "italic" },
        b = { bg = colors.black, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
        x = { bg = colors.black, fg = colors.white },
        y = { bg = colors.black, fg = colors.white },
        z = { bg = colors.black, fg = colors.white },
      },
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

-- vi Color mode
ins_left {
  function()
    return " "
  end,
  color = { fg = colors.statusline_bg, bg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

-- Sep
ins_left {
  function()
    return ""
  end,
  color = { fg = colors.blue, bg = colors.grey }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  "filename",
  -- cond = conditions.buffer_not_empty,
  color = { fg = colors.white, bg = colors.grey },
}

-- Sep
ins_left {
  function()
    return ""
  end,
  color = { fg = colors.grey, bg = colors.statusline_bg }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

-- Nvim Gps
ins_left {
  gps.get_location,
  cond = gps.is_available,
}

-- diff
ins_left {
  "diff",
  source = diff_source,
  symbols = { added = "  ", modified = "柳", removed = " " },
  diff_color = {
    added = { bg = colors.statusline_bg, fg = colors.green },
    modified = { bg = colors.statusline_bg, fg = colors.yellow },
    removed = { bg = colors.statusline_bg, fg = colors.red },
  },
  color = {},
  cond = nil,
}

-- diagnostics
ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.cyan },
  },
  colored = true,
  update_in_insert = false,
}

-- Right

-- lsp name
ins_right {
  function()
    local msg = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " ",
  color = { fg = colors.violet, gui = "bold" },
}

-- Sep
ins_right {
  function()
    return ""
  end,
  color = { fg = colors.blue, bg = colors.statusline_bg }, -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before this
}

-- git icon
ins_right {
  function()
    return " "
  end,
  color = { fg = colors.statusline_bg, bg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before this
}

-- git branch
ins_right {
  "b:gitsigns_head",
  color = { fg = colors.blue, bg = colors.grey },
}

-- Sep
ins_right {
  function()
    return ""
  end,
  color = { fg = colors.red, bg = colors.grey }, -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before this
}

-- Icon
ins_right {
  function()
    return " "
  end,
  color = { fg = colors.statusline_bg, bg = colors.red }, -- Sets highlighting of component
  padding = { left = 0, right = 0 }, -- We don't need space before this
}

-- Mode
ins_right {
  "mode",
  fmt = function(str)
    return str
  end,
  color = { fg = colors.red, bg = colors.grey }, -- Sets highlighting of component
}

lualine.setup(config)
