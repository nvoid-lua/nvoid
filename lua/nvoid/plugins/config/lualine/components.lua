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

return {
  -- Diagnostics
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", hint = " ", info = "" },
    diagnostics_color = {
      error = { fg = colors.red },
      warn = { fg = colors.yellow },
      info = { fg = colors.cyan },
      hint = { fg = colors.cyan },
    },
    colored = true,
    update_in_insert = false,
  },

  -- Lsp
  lsp = {
    function(msg)
      msg = msg or "LS Inactive"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return "LS Inactive"
        end
        return msg
      end
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local unique_client_names = vim.fn.uniq(buf_client_names)
      return "  " .. table.concat(unique_client_names, ", ")
    end,
    color = { gui = "bold" },
  },

  -- Diff
  diff = {
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
  },

  -- filetype
  filetype = {
    "filetype",
    color = { fg = colors.white },
  },

  -- filename
  filename = {
    "filename",
    color = { fg = colors.white },
  },

  -- scrollbar
  scrollbar = {
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
  },
  -- treesitter
  treesitter = {
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return ""
      end
      return ""
    end,
    color = { fg = colors.green },
  },

  -- Branch
  branch = {
    "branch",
    color = { fg = colors.white },
  },
}
