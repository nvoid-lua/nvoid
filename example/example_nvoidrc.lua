local M = {}

-- UI
M.ui = {
	theme = "onedark", -- 'onedark' 'tokyonight' 'nord' 'darkplus'
	transparency = false,
	statusline = "vscode", -- 'nvoid' 'lunarvim' 'vscode' 'bubbles' 'nvchad'
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
M.lsp_add = {
	-- "pyright",
}

-- Add treesitter language
M.ts_add = {
	-- "fish",
}

-- Add Plugins
M.plugins_add = {
	-- { "folke/zen-mode.nvim" },
}

-- Add new whichkey bind
M.whichkey_add = {
	-- ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
}

return M
