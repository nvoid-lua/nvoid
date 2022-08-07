local lsp_installer = require "nvim-lsp-installer"
local notify = require "notify"

local servers = {
  "sumneko_lua",
}

for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  if ok then
    if not server:is_installed() then
      notify("Installing " .. name)
      server:install()
    end
  end
end

local ok, user_lsp = pcall(require, "custom.nvoidrc")
if not ok then
  user_lsp = {}
end

if not vim.tbl_islist(user_lsp.lsp_add) then
  user_lsp.lsp_add = {}
end

for _, name in pairs(user_lsp.lsp_add) do
  local ok2, server = lsp_installer.get_server(name)
  if ok2 then
    if not server:is_installed() then
      notify("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("nvoid.plugins.config.lsp.handlers").on_attach,
    capabilities = require("nvoid.plugins.config.lsp.handlers").capabilities,
  }
  if server.name == "jsonls" then
    local jsonls_opts = require "nvoid.plugins.config.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require "nvoid.plugins.config.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  server:setup(opts)
end)
