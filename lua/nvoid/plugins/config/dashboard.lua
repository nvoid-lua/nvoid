vim.g.dashboard_disable_at_vimenter = 0
vim.g.dashboard_custom_header = {
	"███╗   ██╗██╗   ██╗ ██████╗ ██╗██████╗ ",
	"████╗  ██║██║   ██║██╔═══██╗██║██╔══██╗",
	"██╔██╗ ██║██║   ██║██║   ██║██║██║  ██║",
	"██║╚██╗██║╚██╗ ██╔╝██║   ██║██║██║  ██║",
	"██║ ╚████║ ╚████╔╝ ╚██████╔╝██║██████╔╝",
	"╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚═╝╚═════╝ ",
}
vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
	a = { description = { "  Find File          " }, command = "Telescope find_files" },
	b = { description = { "  New File           " }, command = ":ene!" },
	c = { description = { "  Recent Projects    " }, command = "Telescope projects" },
	d = { description = { "  Recently Used Files" }, command = "Telescope oldfiles" },
	e = { description = { "  Find Word          " }, command = "Telescope live_grep" },
	f = { description = { "  Configuration      " }, command = ":e ~/.config/nvim/lua/custom/nvoidrc.lua" },
}
local nvoid_site = "nvoid.org"
local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
local footer = {
	"Nvoid loaded " .. plugins_count .. " plugins  ",
	"",
	nvoid_site,
}
local text = require("nvoid.core.text")
vim.g.dashboard_custom_footer = text.align_center({ width = 0 }, footer, 0.49) -- Use 0.49 as  counts for 2 characters
