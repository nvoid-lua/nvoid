local M = {}

local fmt = string.format
local text = require "nvoid.ui.text"
local modules = require "nvoid.ui.voidashboard.modules"

function M.toggle_popup(ft)
  local banner = modules.banner
  local buffer = modules.buffer(ft)

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

  local formatters_info = modules.formatters(ft)
  local linters_info = modules.linters(ft)

  local content_provider = function(popup)
    local content = {}

    for _, section in ipairs {
      -- Banner
      text.align_center(popup, banner, 0.5),
      { "" },
      { "" },

      -- Buffer
      text.align_center(popup, { "Buffer Info" }, 0.5),
      text.align_left(popup, buffer, 0.5),
      { "" },

      -- Lsp
      text.align_center(popup, { "Active Client(s)" }, 0.5),
      text.align_left(popup, lsp_info, 0.5),
      { "" },

      -- Formatters
      text.align_center(popup, { "Formatters Info" }, 0.5),
      text.align_left(popup, formatters_info, 0.5),
      { "" },

      -- Linters
      text.align_center(popup, { "Linters Info" }, 0.5),
      text.align_left(popup, linters_info, 0.5),
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
  require "nvoid.ui.voidashboard.hl"(ft)

  return Popup
end

return M
