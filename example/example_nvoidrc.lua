local M = {}

-- UI
M.ui = {
	theme = "catppuccin", -- "catppuccin" "classic-dark" "nord" "onedark" "solarized" "tokyodark" "uwu"
	transparency = false,
	statusline = "nvoid", -- "lunarvim" "nvchad" "nvoid"
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
M.lsp_add = {} -- "bashls",

-- Add treesitter language
M.ts_add = {} -- "all", "fish"

-- Add Plugins
M.plugins_add = {
	-- { "folke/zen-mode.nvim" },
}

-- Add new whichkey bind
M.whichkey_add = {
	-- ["z"] = { "<cmd>ZenMode<cr>", "ZenMode" },
}

return M
