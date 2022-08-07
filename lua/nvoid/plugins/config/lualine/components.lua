local colors = require("base16").get()
local icons = require "nvoid.ui.icons"
local function lspprogress()
  if not rawget(vim, "lsp") then
    return ""
  end

  local Lsp = vim.lsp.util.get_progress_messages()[1]

  if vim.o.columns < 120 or not Lsp then
    return ""
  end

  local msg = Lsp.message or ""
  local percentage = Lsp.percentage or 0
  local title = Lsp.title or ""
  local spinners = { "", "" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

  return ("%#St_LspProgress#" .. content) or ""
end

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
    symbols = { error = icons.lsp.error, warn = icons.lsp.warn, hint = icons.lsp.hint, info = icons.lsp.info },
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
      return icons.statusline.lsp .. table.concat(unique_client_names, ", ")
    end,
    color = { gui = "bold" },
  },

  -- Diff
  diff = {
    "diff",
    source = diff_source,
    symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed },
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
        return icons.statusline.treesitter
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

  -- Mode Evil
  mode_evil = {
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
  },

  -- Mode Minimal
  mode_minimal = {
    "mode",
    fmt = function(str)
      if str == "NORMAL" then
        return " normal"
      end
      if str == "INSERT" then
        return "פֿ insert"
      end
      if str == "COMMAND" then
        return " command"
      end
      if str == "VISUAL" then
        return "濾visual"
      end
      if str == "V-LINE" then
        return "濾v-line"
      end
      if str == "V-BLOCK" then
        return "濾v-block"
      end
      if str == "REPLACE" then
        return "李replace"
      end
      return str
    end,
  },

  -- Mode Nvoid
  mode_nvoid = {
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
  },
  -- lsp status
  lsp_status = {
    function()
      if not rawget(vim, "lsp") then
        return ""
      end

      local Lsp = vim.lsp.util.get_progress_messages()[1]

      if vim.o.columns < 120 or not Lsp then
        return ""
      end

      local msg = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = { "", "" }
      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners
      local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

      return ("%#St_LspProgress#" .. content) or ""
    end,
  },
}
