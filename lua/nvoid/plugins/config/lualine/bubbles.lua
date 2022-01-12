local colors = require("nvoid.colors")

local bubbles_theme = {
	normal = {
		a = { fg = colors.bg, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.bg, bg = colors.bg },
	},

	insert = { a = { fg = colors.bg, bg = colors.blue } },
	visual = { a = { fg = colors.bg, bg = colors.cyan } },
	replace = { a = { fg = colors.bg, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.bg },
		b = { fg = colors.white, bg = colors.bg },
		c = { fg = colors.bg, bg = colors.bg },
	},
}

local function mode()
	local mode_color = {
		n = colors.red,
		i = colors.green,
		v = colors.blue,
		[""] = colors.blue,
		V = colors.blue,
		c = colors.magenta,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[""] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		["r?"] = colors.cyan,
		["!"] = colors.red,
		t = colors.red,
	}
	vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
	return "P"
end

require("lualine").setup({
	options = {
		theme = bubbles_theme,
		component_separators = "|",
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ mode, separator = { left = "" }, right_padding = 1 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = { "" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "" },
	},
	tabline = {},
	extensions = {},
})
