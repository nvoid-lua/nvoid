local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local async = require "plenary.async"
local notify = require("notify").async

local servers = {
  "sumneko_lua",
}

for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  if ok then
    if not server:is_installed() then
      async.run(function()
        notify("Installing " .. name).events.close()
      end)
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
      async.run(function()
        notify("Installing " .. name).events.close()
      end)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("nvoid.plugins.config.lsp.handlers").on_attach,
    capabilities = require("nvoid.plugins.config.lsp.handlers").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("nvoid.plugins.config.lsp.settings").lua()
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("nvoid.plugins.config.lsp.settings").json()
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "yamlls" then
    local yamlls_opts = require("nvoid.plugins.config.lsp.settings").yaml()
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

  server:setup(opts)
end)
