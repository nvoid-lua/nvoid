local fn = vim.fn

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

-- LSP STUFF
M.get_lsp = function()
  local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
  if #buf_clients == 0 then
    return "LSP Inactive"
  end

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}
  local copilot_active = false

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" and client.name ~= "copilot" then
      table.insert(buf_client_names, client.name)
    end

    if client.name == "copilot" then
      copilot_active = true
    end
  end

  -- add formatter
  local formatters = require "nvoid.lsp.null-ls.formatters"
  local supported_formatters = formatters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local linters = require "nvoid.lsp.null-ls.linters"
  local supported_linters = linters.list_registered(buf_ft)
  vim.list_extend(buf_client_names, supported_linters)

  local unique_client_names = vim.fn.uniq(buf_client_names)

  local language_servers = nvoid.icons.statusline.lsp .. table.concat(unique_client_names, ", ")

  if copilot_active then
    language_servers = language_servers .. "%#SLCopilot#" .. " " .. nvoid.icons.git.Octoface .. "%*"
  end

  return "%#St_LspStatus#" .. language_servers .. " "
end

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

M.scrollbar = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return "%#St_pos_text#" .. chars[index]
end
return M
