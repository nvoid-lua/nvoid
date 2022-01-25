-- Local Variables
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local function button(shortcut, text, cmd)
	local sc = shortcut:gsub("%s", ""):gsub("LDR", "<space>")

	local button_opts = {
		position = "center",
		text = text,
		shortcut = shortcut,
		cursor = 5,
		width = 20,
		align_shortcut = "right",
		hl_shortcut = "AlphaBody",
		hl = "AlphaBody",
	}
	if cmd then
		button_opts.keymap = { "n", sc, cmd, { noremap = true, silent = true } }
	end

	-- Returnd default button data
	return {
		type = "button",
		val = text,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = button_opts,
	}
end
local nvoid_site = "爵nvoid.org"

-- Set header
dashboard.section.header.val = {
	"                                         ",
	" ███╗   ██╗██╗   ██╗ ██████╗ ██╗██████╗  ",
	" ████╗  ██║██║   ██║██╔═══██╗██║██╔══██╗ ",
	" ██╔██╗ ██║██║   ██║██║   ██║██║██║  ██║ ",
	" ██║╚██╗██║╚██╗ ██╔╝██║   ██║██║██║  ██║ ",
	" ██║ ╚████║ ╚████╔╝ ╚██████╔╝██║██████╔╝ ",
	" ╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚═╝╚═════╝  ",
	"                                         ",
}

-- Set menu
dashboard.section.buttons.val = {
	button("f", "  > Find file", ":Telescope find_files<CR>"),
	button("n", "  > New file", ":enew<CR>"),
	button("o", "  > Recent", ":Telescope oldfiles<CR>"),
	button("e", "  > Edit Confg", ":e ~/.config/nvim/lua/custom/nvoidrc.lua<CR>"),
	button("q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set Footer
dashboard.section.footer.val = {
	nvoid_site,
}

-- Important
alpha.setup(dashboard.opts)
