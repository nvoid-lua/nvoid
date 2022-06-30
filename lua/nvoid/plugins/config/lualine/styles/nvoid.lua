-- LuaLine
local _lualine, lualine = pcall(require, "lualine")
if not _lualine then
  return
end

-- Colors
local colors = require("nvoid.colors").get()

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

-- Config
local diff = {
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
    return " NVOID"
  end,
  color = "LualineMode",
  padding = { right = 1 },
}

local lsp_name = {
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
  color = { fg = colors.red, gui = "bold" },
}

local diagnostics = {
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

local filetype = {
  "filetype",
  color = { fg = colors.white },
}

local scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  color = { fg = colors.yellow, bg = colors.statusline_bg },
  cond = nil,
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
    lualine_b = { "filename" },
    lualine_c = {
      { "branch", color = { fg = colors.yellow } },
      diff,
    },
    lualine_x = { lsp_name, diagnostics },
    lualine_y = { filetype },
    lualine_z = { scrollbar },
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
