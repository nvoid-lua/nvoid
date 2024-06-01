local M = {}
local fmt = string.format
local lsp_utils = require "nvoid.lsp.utils"
local function str_list(list)
  return #list == 1 and list[1] or fmt("[%s]", table.concat(list, ", "))
end

M.banner = {
  "",
  [[  _   ___      ______ _____ _____   ]],
  [[ | \ | \ \    / / __ \_   _|  __ \  ]],
  [[ |  \| |\ \  / / |  | || | | |  | | ]],
  [[ | . ` | \ \/ /| |  | || | | |  | | ]],
  [[ | |\  |  \  / | |__| || |_| |__| | ]],
  [[ |_| \_|   \/   \____/_____|_____/  ]],
}

function M.linters_formater(ft)
  local null_linters = require "nvoid.lsp.null-ls.linters"
  local supported_linters = null_linters.list_supported(ft)
  local registered_linters = null_linters.list_registered(ft)
  local null_formatters = require "nvoid.lsp.null-ls.formatters"
  local registered_formatters = null_formatters.list_registered(ft)
  local supported_formatters = null_formatters.list_supported(ft)

  local section = {
    fmt(
      nvoid.icons.ui.spinnerActive .. " Active Linters: %s%s",
      table.concat(registered_linters, " " .. nvoid.icons.ui.BoxChecked .. " , "),
      vim.tbl_count(registered_linters) > 0 and " " .. nvoid.icons.ui.BoxChecked .. " " or ""
    ),
    fmt(
      nvoid.icons.ui.spinnerActive .. " Active Formatters: %s%s",
      table.concat(registered_formatters, " " .. " , "),
      vim.tbl_count(registered_formatters) > 0 and " " .. " " or ""
    ),
    fmt(nvoid.icons.ui.spinnerActive .. " Supported Linters: %s", str_list(supported_linters)), --.
    fmt(nvoid.icons.ui.spinnerActive .. " Supported Formatters: %s", str_list(supported_formatters)),
  }

  return section
end

function M.make_client_info(client)
  if client.name == "null-ls" then
    return
  end
  local name = client.name
  local id = client.id
  local filetypes = lsp_utils.get_supported_filetypes(name)
  local client_info = {
    fmt(nvoid.icons.ui.spinnerActive .. " name: %s", name),
    fmt(nvoid.icons.ui.spinnerActive .. " id: %s", tostring(id)),
    fmt(nvoid.icons.ui.spinnerActive .. " supported filetype(s): %s", str_list(filetypes)),
  }
  return client_info
end

function M.is_treesitter_active()
  local bufnr = vim.api.nvim_get_current_buf()
  local ts_active_buffers = vim.tbl_keys(vim.treesitter.highlighter.active)
  local status = "inactive"
  if vim.tbl_contains(ts_active_buffers, bufnr) then
    status = "active"
  end
  return status
end

function M.buffer(ft)
  return {
    fmt(nvoid.icons.ui.spinnerActive .. " filetype: %s", ft),
    fmt(nvoid.icons.ui.spinnerActive .. " treesitter status: %s", M.is_treesitter_active()),
  }
end

function M.nvoidinfo()
  return {
    fmt(nvoid.icons.ui.spinnerActive .. " Colorscheme: %s", vim.g.theme),
    -- fmt(nvoid.icons.ui.spinnerActive .. " Plugins: %s", "11"),
  }
end

return M
