local fn = vim.fn
local icons = require "nvoid.ui.icons"

local sep_style = {
  right = "█",
}

local sep_r = sep_style["right"]

local modes = {
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

M.mode = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modes[m][2] .. "#" .. " " .. modes[m][1] .. " "
  return current_mode
end

M.fileInfo = function()
  local icon = ""
  local filename = fn.fnamemodify(fn.expand "%:t", ":r")
  local extension = fn.expand "%:e"

  if filename == "" then
    icon = icon .. "  Empty "
  else
    filename = " " .. filename
  end

  local devicons_present, devicons = pcall(require, "nvim-web-devicons")

  if not devicons_present then
    return " "
  end

  local ft_icon = devicons.get_icon(filename, extension)
  icon = (ft_icon ~= nil and " " .. ft_icon) or icon

  return "%#St_file_info#" .. icon .. filename .. "%#St_file_sep#" .. sep_r
end

M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
  local branch_name = "   " .. git_status.head .. " "
  local git_info = branch_name .. added .. changed .. removed

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

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  errors = (errors and errors > 0) and ("%#St_LspError#" .. " " .. errors .. " ") or ""
  warnings = (warnings and warnings > 0) and ("%#St_LspWarning#" .. "  " .. warnings .. " ") or ""
  hints = (hints and hints > 0) and ("%#St_LspHints#" .. "ﯧ " .. hints .. " ") or ""
  info = (info and info > 0) and ("%#St_LspInfo#" .. " " .. info .. " ") or ""

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

M.scrollbar = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return "%#St_pos_text#" .. chars[index]
end
return M
