local M = {}

-- UI
M.ui = {
	theme = "onedarker", -- 'onedarker' 'gruvbox' 'dracula' 'doom-one' 'tokyonight' 'nord' 'darkplus'
	transparency = false,
	statusline = "nvoid", -- 'nvoid' 'lunarvim' 'vscode' 'bubbles'
}

-- Options
M.options = {
	clipboard = "unnamedplus",
	cmdheight = 1,
	mouse = "a",
	mapleader = " ",
	wrap = false,
	number = true,
	relative_number = false,
	number_width = 6,
	cursor_line = true,
	hidden = true,
	expand_tab = true,
	ignore_case = true,
	smart_case = true,
	smart_indent = true,
	swap_file = false,
	backup = false,
	show_mode = false,
}

-- Add lsp
M.lsp_add = {}

-- Add treesitter language
M.ts_add = {}

-- Add Plugins
M.plugins_add = {}

return M
