local M = {
  banner = {
    "",
    [[                     _     __ ]],
    [[   ____ _   ______  (_)___/ / ]],
    [[  / __ \ | / / __ \/ / __  /  ]],
    [[ / / / / |/ / /_/ / / /_/ /   ]],
    [[/_/ /_/|___/\____/_/\__,_/    ]],
  },
}

local fmt = string.format
local text = require("nvoid.ui.text")

local function str_list(list)
  return #list == 1 and list[1] or fmt("[%s]", table.concat(list, ", "))
end

local function make_client_info(client)
  if client.name == "null-ls" then
    return
  end
  local name = client.name
  local id = client.id
  local attached_buffers_list = str_list(vim.lsp.get_buffers_by_client_id(client.id))
  local client_info = {
    fmt("* name:                      %s", name),
    fmt("* id:                        %s", tostring(id)),
    fmt("* attached buffers:          %s", tostring(attached_buffers_list)),
    fmt("* root_dir pattern:          %s", tostring(attached_buffers_list)),
  }
  return client_info
end

function M.toggle_popup(ft)
  local clients = vim.lsp.get_active_clients()
  local client_names = {}
  local bufnr = vim.api.nvim_get_current_buf()
  local ts_active_buffers = vim.tbl_keys(vim.treesitter.highlighter.active)
  local is_treesitter_active = function()
    local status = "inactive"
    if vim.tbl_contains(ts_active_buffers, bufnr) then
      status = "active"
    end
    return status
  end
  local header = {
    "Buffer info",
    fmt("* filetype:                %s", ft),
    fmt("* bufnr:                   %s", bufnr),
    fmt("* treesitter status:       %s", is_treesitter_active()),
  }

  local lsp_info = {
    "Active client(s)",
  }

  for _, client in pairs(clients) do
    local client_info = make_client_info(client)
    if client_info then
      vim.list_extend(lsp_info, client_info)
    end
    table.insert(client_names, client.name)
  end

  local content_provider = function(popup)
    local content = {}

    for _, section in ipairs({
      M.banner,
      { "" },
      { "" },
      header,
      { "" },
      lsp_info,
      { "" },
    }) do
      vim.list_extend(content, section)
    end

    return text.align_left(popup, content, 0.5)
  end

  local function set_syntax_hl()
    vim.cmd([[highlight NVInfoIdentifier gui=bold]])
    vim.cmd([[highlight link NVInfoHeader Type]])
    vim.fn.matchadd("NVInfoHeader", "Buffer info")
    vim.fn.matchadd("NVInfoHeader", "Active client(s)")
    vim.fn.matchadd("NVInfoHeader", fmt("Overridden %s server(s)", ft))
    vim.fn.matchadd("NVInfoHeader", "Formatters info")
    vim.fn.matchadd("NVInfoHeader", "Linters info")
    vim.fn.matchadd("NVInfoHeader", "Code actions info")
    vim.fn.matchadd("NVInfoHeader", "Automatic LSP info")
    vim.fn.matchadd("NVInfoIdentifier", " " .. ft .. "$")
    vim.fn.matchadd("string", "true")
    vim.fn.matchadd("string", "active")
    vim.fn.matchadd("string", "")
    vim.fn.matchadd("boolean", "inactive")
    vim.fn.matchadd("error", "false")
  end

  local Popup = require("nvoid.ui.popup"):new({
    win_opts = { number = false },
    buf_opts = { modifiable = false, filetype = "lspinfo" },
  })
  Popup:display(content_provider)
  set_syntax_hl()

  return Popup
end

return M
