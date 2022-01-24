-- reload themes without restarting vim
-- if no theme name given then reload the current theme
local function reload_theme(theme_name)
	local reload_plugin = require("nvchad").reload_plugin

	-- if theme name is empty or nil, then reload the current theme
	if theme_name == nil or theme_name == "" then
		theme_name = vim.g.nvchad_theme
	end

	if not pcall(require, "nvoid.colors.hl_themes." .. theme_name) then
		print("No such theme ( " .. theme_name .. " )")
		return false
	end

	vim.g.nvchad_theme = theme_name

	-- reload the base16 theme and highlights
	require("nvoid.colors").init(theme_name)

	if
		not reload_plugin({
			"nvoid.plugins.config.bufferline",
			-- "nvoid.plugins.config.statusline",
		})
	then
		print("Error: Not able to reload all plugins.")
		return false
	end

	return true
end

return reload_theme
