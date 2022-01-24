local M = {}
M.change_theme = require("nvoid.core.telescope.change_theme")
M.clear_cmdline = function()
	vim.defer_fn(function()
		vim.cmd("echo")
	end, 0)
end
M.echo = function(opts)
	if opts == nil or type(opts) ~= "table" then
		return
	end
	vim.api.nvim_echo(opts, false, {})
end
M.file = function(mode, filepath, content)
	local data
	local fd = assert(vim.loop.fs_open(filepath, mode, 438))
	local stat = assert(vim.loop.fs_fstat(fd))
	if stat.type ~= "file" then
		data = false
	else
		if mode == "r" then
			data = assert(vim.loop.fs_read(fd, stat.size, 0))
		else
			assert(vim.loop.fs_write(fd, content, 0))
			data = true
		end
	end
	assert(vim.loop.fs_close(fd))
	return data
end
M.list_themes = function(return_type)
	local themes = {}
	local themes_folder = vim.fn.stdpath("data") .. "/site/pack/packer/opt/nvim-base16.lua/lua/hl_themes"
	local fd = vim.loop.fs_scandir(themes_folder)
	if fd then
		while true do
			local name, typ = vim.loop.fs_scandir_next(fd)
			if name == nil then
				break
			end
			if typ ~= "directory" and string.find(name, ".lua$") then
				if return_type == "keys_as_value" then
					themes[vim.fn.fnamemodify(name, ":r")] = true
				else
					table.insert(themes, vim.fn.fnamemodify(name, ":r"))
				end
			end
		end
	end
	return themes
end
M.reload_plugin = function(plugins)
	local status = true
	local function _reload_plugin(plugin)
		local loaded = package.loaded[plugin]
		if loaded then
			package.loaded[plugin] = nil
		end
		local ok, err = pcall(require, plugin)
		if not ok then
			print("Error: Cannot load " .. plugin .. " plugin!\n" .. err .. "\n")
			status = false
		end
	end

	if type(plugins) == "string" then
		_reload_plugin(plugins)
	elseif type(plugins) == "table" then
		for _, plugin in ipairs(plugins) do
			_reload_plugin(plugin)
		end
	end
	return status
end

M.reload_theme = require("nvoid.core.telescope.reload_theme")

return M
