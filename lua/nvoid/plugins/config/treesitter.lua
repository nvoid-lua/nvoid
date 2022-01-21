local present, ts_config = pcall(require, "nvim-treesitter.configs")
local config = require("nvoid.core.utils").load_config()

if not present then
	return
end

ts_config.setup({
	use_languagetree = true,
	on_config_done = nil,
	ensure_installed = config.ts_add,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
		disable = { "latex" },
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = true,
		config = {
			typescript = "// %s",
			css = "/* %s */",
			scss = "/* %s */",
			html = "<!-- %s -->",
			svelte = "<!-- %s -->",
			vue = "<!-- %s -->",
			json = "",
		},
	},
	matchup = {
		enable = false,
	},
	indent = { enable = true, disable = { "yaml" } },
	autotag = { enable = false },
	textobjects = {
		swap = {
			enable = false,
		},
		select = {
			enable = false,
		},
	},
	playground = {
		enable = false,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	rainbow = {
		enable = false,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	},
})
