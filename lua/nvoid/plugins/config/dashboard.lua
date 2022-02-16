local g = vim.g
local fn = vim.fn
g.dashboard_disable_at_vimenter = 0
g.dashboard_custom_header = {
	"███╗   ██╗██╗   ██╗ ██████╗ ██╗██████╗ ",
	"████╗  ██║██║   ██║██╔═══██╗██║██╔══██╗",
	"██╔██╗ ██║██║   ██║██║   ██║██║██║  ██║",
	"██║╚██╗██║╚██╗ ██╔╝██║   ██║██║██║  ██║",
	"██║ ╚████║ ╚████╔╝ ╚██████╔╝██║██████╔╝",
	"╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚═╝╚═════╝ ",
}
g.dashboard_default_executive = "telescope"
g.dashboard_custom_section = {
	a = { description = { "  Find File        " }, command = ":Telescope find_files" },
	b = { description = { "  New File         " }, command = ":ene!" },
	c = { description = { "  Recent Files     " }, command = ":Telescope oldfiles" },
	d = { description = { "  Configuration    " }, command = ":e ~/.config/nvim/lua/custom/nvoidrc.lua" },
	e = { description = { "  Load Last Session" }, command = ":SessionLoad" },
	f = { description = { "  Quit Nvim        " }, command = ":q!" },
}
local nvoid_site = "爵nvoid.org"
local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
local footer = {
	"Nvoid loaded " .. plugins_count .. " plugins ",
	"",
	nvoid_site,
}
local text = require("nvoid.core.text")
g.dashboard_custom_footer = text.align_center({ width = 0 }, footer, 0.49)
