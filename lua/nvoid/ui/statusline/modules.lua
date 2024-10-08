local fn = vim.fn
local version = vim.version().minor
local icons = nvoid.icons

local modesM = {
  ["n"] = { " normal", "St_ModeM" },
  ["no"] = { " normal", "St_ModeM" },
  ["i"] = { " insert", "St_ModeM" },
  ["ic"] = { " insert", "St_ModeM" },
  ["t"] = { " terminal", "St_ModeM" },
  ["nt"] = { " terminal", "St_ModeM" },
  ["v"] = { " visual", "St_ModeM" },
  ["V"] = { " v-line", "St_ModeM" },
  [""] = { " v-block", "St_ModeM" },
  ["R"] = { " replace", "St_ModeM" },
  ["Rv"] = { " replace", "St_ModeM" },
  ["s"] = { " select", "St_ModeM" },
  ["S"] = { " s-line", "St_ModeM" },
  [""] = { " s-block", "St_ModeM" },
  ["c"] = { " command", "St_ModeM" },
  ["cv"] = { " command", "St_ModeM" },
  ["ce"] = { " command", "St_ModeM" },
  ["r"] = { " prompt", "St_ModeM" },
  ["rm"] = { " more", "St_ModeM" },
  ["r?"] = { " confirm", "St_ModeM" },
  ["!"] = { " shell", "St_ModeM" },
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
  local icon = " " .. icons.ui.File .. " "
  local filename = (fn.expand "%" == "" and "Empty ") or fn.expand "%:t"

  if filename ~= "Empty " then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(filename)
      icon = (ft_icon ~= nil and " " .. ft_icon) or ""
    end

    filename = " " .. filename .. " "
  end

  return "%#St_file_info#" .. icon .. filename .. " " .. "%#St_file_sep#"
end

-- Git
M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict
  local added = (git_status.added and git_status.added ~= 0) and (icons.git.LineAdded .. " " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0)
      and (icons.git.LineModified .. " " .. git_status.changed)
    or ""
  local removed = (git_status.removed and git_status.removed ~= 0)
      and (icons.git.LineRemoved .. " " .. git_status.removed)
    or ""
  local branch_name = icons.git.Branch .. " " .. git_status.head

  return "%#St_gitIcons#"
    .. " "
    .. branch_name
    .. " "
    .. "%#St_gitAdd#"
    .. added
    .. " "
    .. "%#St_gitMod#"
    .. changed
    .. " "
    .. "%#St_gitRem#"
    .. removed
end

-- LSP STUFF
M.get_lsp = function()
  local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
  if #buf_clients == 0 then
    return ""
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

  local language_servers = icons.ui.Lsp .. " " .. table.concat(unique_client_names, ", ")

  if copilot_active then
    language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
  end

  return "%#St_LspStatus#" .. language_servers
end

M.lsp_progress = function()
  if version < 10 then
    return ""
  end

  local msg = vim.lsp.status()

  if #msg == 0 or vim.o.columns < 120 then
    return ""
  end

  local spinners = { icons.ui.spinnerInactive, icons.ui.spinnerActive }
  local ms = vim.loop.hrtime() / 1e6
  local frame = math.floor(ms / 100) % #spinners

  return "%#St_LspProgress#" .. spinners[frame + 1] .. " " .. msg
end

M.lsp_diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local diagnostic = vim.diagnostic
  local errors = #diagnostic.get(0, { severity = diagnostic.severity.ERROR })
  local warnings = #diagnostic.get(0, { severity = diagnostic.severity.WARN })
  local hints = #diagnostic.get(0, { severity = diagnostic.severity.HINT })
  local info = #diagnostic.get(0, { severity = diagnostic.severity.INFO })

  local get_errors = (errors and errors > 0) and (icons.diagnostics.BoldError .. " " .. errors .. " ") or ""
  local get_warnings = (warnings and warnings > 0) and (icons.diagnostics.BoldWarning .. " " .. warnings .. " ") or ""
  local get_hints = (hints and hints > 0) and (icons.diagnostics.BoldHint .. " " .. hints .. " ") or ""
  local get_info = (info and info > 0) and (icons.diagnostics.BoldInformation .. " " .. info .. " ") or ""

  return "%#St_lspError#"
    .. get_errors
    .. "%#St_lspWarning#"
    .. get_warnings
    .. "%#St_lspHints#"
    .. get_hints
    .. "%#St_lspInfo#"
    .. get_info
end

M.scrollbar = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = icons.Scroll
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return "%#St_pos_text#" .. chars[index]
end
return M
