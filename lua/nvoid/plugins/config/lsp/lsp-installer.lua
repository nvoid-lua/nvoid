local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local async = require("plenary.async")
local notify = require("notify").async
local config = require("nvoid.core.utils").load_config().lsp
for _, name in pairs(config.add) do
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
    on_attach = require("nvoid.plugins.config.lsp.config").on_attach,
    capabilities = require("nvoid.plugins.config.lsp.config").capabilities,
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("nvoid.plugins.config.lsp.settings").lua()
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require("nvoid.plugins.config.lsp.settings").json()
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  server:setup(opts)
end)
