local present, nvimtree = pcall(require, "nvim-tree")
local config = require("nvoid.core.utils").load_config()
local g = vim.g
if not present then
	return
end
if config.options.nvimtree_indent_markers == true then
	g.nvim_tree_indent_markers = 1
elseif config.options.nvimtree_indent_markers == false then
	g.nvim_tree_indent_markers = 0
end
g.nvim_tree_add_trailing = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_root_folder_modifier = table.concat({ ":t" })
g.nvim_tree_window_picker_exclude = {
	filetype = { "notify", "packer", "qf" },
	buftype = { "terminal" },
}
g.nvim_tree_show_icons = {
	git = 1,
	folder_arrows = 1,
	folders = 1,
	files = 1,
}
g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = " ",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}
nvimtree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = { "dashboard" },
	auto_close = true,
	open_on_tab = true,
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	filters = {
		dotfiles = false,
		custom = { "node_modules", ".cache", ".git" },
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 30,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {},
		},
	},
})
