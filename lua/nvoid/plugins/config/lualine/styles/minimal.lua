local _lualine, lualine = pcall(require, "lualine")
if not _lualine then
	return
end

local mode = {
	"mode",
	fmt = function(str)
		if str == "NORMAL" then
			return " normal"
		end
		if str == "INSERT" then
			return "פֿ insert"
		end
		if str == "COMMAND" then
			return " command"
		end
		if str == "VISUAL" then
			return "濾visual"
		end
		if str == "V-LINE" then
			return "濾v-line"
		end
		if str == "V-BLOCK" then
			return "濾v-block"
		end
		if str == "REPLACE" then
			return "李replace"
		end
		return str
	end,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = require("nvoid.plugins.config.lualine.theme").min(),
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "filename", "branch" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
