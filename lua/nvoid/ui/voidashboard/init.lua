local M = {}

local text = require "nvoid.ui.text"
local modules = require "nvoid.ui.voidashboard.modules"

function M.toggle_popup(ft)
  local banner = modules.banner
  local nvoidinfo = text.format_table(modules.nvoidinfo(), 2, "    ")
  local buffer = text.format_table(modules.buffer(ft), 2, "    ")

  local clients = vim.lsp.get_active_clients()
  local client_names = {}
  local lsp_info = {}
  for _, client in pairs(clients) do
    local client_info = modules.make_client_info(client)
    if client_info then
      vim.list_extend(lsp_info, client_info)
    end
    table.insert(client_names, client.name)
  end

  local lsp = text.format_table(lsp_info, 2, "    ")
  local lint_format = text.format_table(modules.linters_formater(ft), 2, "    ")

  local content_provider = function(popup)
    local content = {}

    for _, section in ipairs {
      -- Banner
      text.align_center(popup, banner, 0.5),
      { "" },
      { "" },

      -- Nvoid
      text.align_center(popup, { "Nvoid Info" }, 0.5),
      text.align_left(popup, nvoidinfo, 0.5),
      { "" },

      -- Buffer
      text.align_center(popup, { "Buffer Info" }, 0.5),
      text.align_left(popup, buffer, 0.5),
      { "" },

      -- Lsp
      text.align_center(popup, { "Active Client(s)" }, 0.5),
      text.align_left(popup, lsp, 0.5),
      { "" },

      -- Formatters and linters
      text.align_center(popup, { "Formatters and Linters" }, 0.5),
      text.align_left(popup, lint_format, 0.5),
      { "" },

    } do
      vim.list_extend(content, section)
    end

    return content
  end

  local Popup = require("nvoid.ui.popup"):new {
    win_opts = { number = false },
    buf_opts = { modifiable = false, filetype = "lspinfo" },
  }
  Popup:display(content_provider)
  require "nvoid.ui.voidashboard.hl" (ft)

  return Popup
end

return M
