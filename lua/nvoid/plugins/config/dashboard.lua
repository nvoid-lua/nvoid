local g = vim.g
g.dashboard_disable_at_vimenter = 0
g.dashboard_default_executive = "telescope"
g.dashboard_active = false
g.dashboard_on_config_done = nil
g.dashboard_custom_header = {
	"███╗   ██╗██╗   ██╗ ██████╗ ██╗██████╗ ",
	"████╗  ██║██║   ██║██╔═══██╗██║██╔══██╗",
	"██╔██╗ ██║██║   ██║██║   ██║██║██║  ██║",
	"██║╚██╗██║╚██╗ ██╔╝██║   ██║██║██║  ██║",
	"██║ ╚████║ ╚████╔╝ ╚██████╔╝██║██████╔╝",
	"╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚═╝╚═════╝ ",
	"  ",
}

g.dashboard_disable_statusline = 0
local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

g.dashboard_custom_footer = {
	"   ",
	"   ",
	"NVOID Loaded " .. plugins_count .. " plugins",
}

g.dashboard_custom_section = {
	a = { description = { "  Find File          " }, command = "Telescope find_files" },
	b = { description = { "  New File           " }, command = ":ene!" },
	c = { description = { "  Recent Projects    " }, command = "Telescope projects" },
	d = { description = { "  Recently Used Files" }, command = "Telescope oldfiles" },
	e = { description = { "  Find Word          " }, command = "Telescope live_grep" },
	f = { description = { "  Configuration      " }, command = "e ~/.config/nvim/lua/custom/nvoidrc.lua" },
}
