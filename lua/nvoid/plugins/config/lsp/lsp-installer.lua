-- Lsp Installer
local lsp_installer = require("nvim-lsp-installer")
local config = require('nvoid.core.def-config')
local servers = config.lsp

for _, name in pairs(servers) do
	local ok, server = lsp_installer.get_server(name)
	if ok then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end
lsp_installer.on_server_ready(function(server)
	local default_opts = {
		on_attach = require("nvoid.plugins.config.lsp.handlers").on_attach,
		capabilities = require("nvoid.plugins.config.lsp.handlers").capabilities,
	}
	local server_opts = {
["sumneko_lua"] = function()
    default_opts.settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
end,
	}
	server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
