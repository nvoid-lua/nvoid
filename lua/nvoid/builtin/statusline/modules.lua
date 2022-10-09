local fn = vim.fn
local icons = require "nvoid.interface.icons"

local modesM = {
  ["n"] = { " normal", "St_ModeM" },
  ["no"] = { " normal", "St_ModeM" },
  ["i"] = { "פֿ insert", "St_ModeM" },
  ["ic"] = { "פֿ insert", "St_ModeM" },
  ["t"] = { " terminal", "St_ModeM" },
  ["nt"] = { " terminal", "St_ModeM" },
  ["v"] = { "濾visual", "St_ModeM" },
  ["V"] = { "濾v-line", "St_ModeM" },
  [""] = { "濾v-block", "St_ModeM" },
  ["R"] = { "李replace", "St_ModeM" },
  ["Rv"] = { "李replace", "St_ModeM" },
  ["s"] = { "Nvoid", "St_ModeM" },
  ["S"] = { "Nvoid", "St_ModeM" },
  [""] = { "Nvoid", "St_ModeM" },
  ["c"] = { " command", "St_ModeM" },
  ["cv"] = { " command", "St_ModeM" },
  ["ce"] = { " command", "St_ModeM" },
  ["r"] = { "", "St_ModeM" },
  ["rm"] = { "", "St_ModeM" },
  ["r?"] = { "", "St_ModeM" },
  ["!"] = { "", "St_ModeM" },
}

local modesE = {
  ["n"] = { "█", "St_NormalModeE" },
  ["no"] = { "█", "St_NormalModeE" },
  ["i"] = { "█", "St_InsertModeE" },
  ["ic"] = { "█", "St_InsertModeE" },
  ["t"] = { "█", "St_TerminalModeE" },
  ["nt"] = { "█", "St_NTerminalModeE" },
  ["v"] = { "█", "St_VisualModeE" },
  ["V"] = { "█", "St_VisualModeE" },
  [""] = { "█", "St_VisualModeE" },
  ["R"] = { "█", "St_ReplaceModeE" },
  ["Rv"] = { "█", "St_ReplaceModeE" },
  ["s"] = { "█", "St_SelectModeE" },
  ["S"] = { "█", "St_SelectModeE" },
  [""] = { "█", "St_SelectModeE" },
  ["c"] = { "█", "St_CommandModeE" },
  ["cv"] = { "█", "St_CommandModeE" },
  ["ce"] = { "█", "St_CommandModeE" },
  ["r"] = { "█", "St_ConfirmModeE" },
  ["rm"] = { "█", "St_ConfirmModeE" },
  ["r?"] = { "█", "St_ConfirmModeE" },
  ["!"] = { "█", "St_TerminalModeE" },
}

local modesN = {
  ["n"] = { "Nvoid", "St_NormalMode" },
  ["no"] = { "Nvoid", "St_NormalMode" },
  ["i"] = { "Nvoid", "St_InsertMode" },
  ["ic"] = { "Nvoid", "St_InsertMode" },
  ["t"] = { "Nvoid", "St_TerminalMode" },
  ["nt"] = { "Nvoid", "St_NTerminalMode" },
  ["v"] = { "Nvoid", "St_VisualMode" },
  ["V"] = { "Nvoid", "St_VisualMode" },
  [""] = { "Nvoid", "St_VisualMode" },
  ["R"] = { "Nvoid", "St_ReplaceMode" },
  ["Rv"] = { "Nvoid", "St_ReplaceMode" },
  ["s"] = { "Nvoid", "St_SelectMode" },
  ["S"] = { "Nvoid", "St_SelectMode" },
  [""] = { "Nvoid", "St_SelectMode" },
  ["c"] = { "Nvoid", "St_CommandMode" },
  ["cv"] = { "Nvoid", "St_CommandMode" },
  ["ce"] = { "Nvoid", "St_CommandMode" },
  ["r"] = { "Nvoid", "St_ConfirmMode" },
  ["rm"] = { "Nvoid", "St_ConfirmMode" },
  ["r?"] = { "Nvoid", "St_ConfirmMode" },
  ["!"] = { "Nvoid", "St_TerminalMode" },
}

local M = {}

M.modeM = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modesM[m][2] .. "#" .. " " .. modesM[m][1] .. " "
  return current_mode
end

M.modeE = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modesE[m][2] .. "#" .. "" .. modesE[m][1] .. ""
  return current_mode
end

M.modeN = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modesN[m][2] .. "#" .. " " .. modesN[m][1] .. " "
  return current_mode
end

M.fileInfo = function()
  local icon = ""
  local filename = fn.fnamemodify(fn.expand "%:t", ":r")
  local extension = fn.expand "%:e"

  if filename == "" then
    icon = icon .. "  Empty"
  else
    filename = " " .. filename
  end

  local devicons_present, devicons = pcall(require, "nvim-web-devicons")

  if not devicons_present then
    return " "
  end

  local ft_icon = devicons.get_icon(filename, extension)
  icon = (ft_icon ~= nil and " " .. ft_icon) or icon

  return "%#St_file_info#" .. icon .. filename .. " " .. "%#St_file_sep#"
end

M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("%#St_gitAdd#" .. icons.git.added .. git_status.added)
      or ""
  local changed = (git_status.changed and git_status.changed ~= 0)
      and ("%#St_gitMod#" .. icons.git.modified .. git_status.changed)
      or ""
  local removed = (git_status.removed and git_status.removed ~= 0)
      and ("%#St_gitRem#" .. icons.git.removed .. git_status.removed)
      or ""
  local branch_name = "   " .. git_status.head .. " "
  local git_info = "%#St_gitIcons#" .. branch_name .. added .. " " .. changed .. " " .. removed

  return "%#St_gitIcons#" .. git_info
end

-- LSP STUFF
M.lsp_progress = function()
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

M.diagnostics = function()
  if not #vim.diagnostic.get(0) then
    return ""
  end

  local Errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local Warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local Hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local Info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local errors = (Errors and Errors > 0) and ("%#St_LspError#" .. icons.lsp.error .. Errors .. " ") or ""
  local warnings = (Warnings and Warnings > 0) and ("%#St_LspWarning#" .. icons.lsp.warn .. Warnings .. " ") or ""
  local hints = (Hints and Hints > 0) and ("%#St_LspHints#" .. icons.lsp.hint .. Hints .. " ") or ""
  local info = (Info and Info > 0) and ("%#St_LspInfo#" .. icons.lsp.info .. Info .. " ") or ""

  return errors .. warnings .. hints .. info
end

M.lsp = function(msg)
  msg = msg or ""
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    if type(msg) == "boolean" or #msg == 0 then
      return ""
    end
    return msg
  end
  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end
  local unique_client_names = vim.fn.uniq(buf_client_names)
  return "%#St_LspStatus#" .. icons.statusline.lsp .. table.concat(unique_client_names, ", ") .. " "
end

M.treesitter_status = function()
  local ts_avail, ts = pcall(require, "nvim-treesitter.parsers")
  return (ts_avail and ts.has_parser()) and "%#St_Treesitter#" .. icons.statusline.treesitter .. " " or ""
end

M.scrollbar = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return "%#St_pos_text#" .. chars[index]
end
return M
