local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok2 then
  return
end
local config = require("nvoid.core.utils").load_config().lsp.add

mason.setup()
mason_lspconfig.setup({
  ensure_installed = config,
})
mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
})
