local M = {}
local colors = require("nvoid.colors").get()
M.min = function()
	local theme = {}
	theme.normal = {
		a = { bg = colors.statusline_bg, fg = colors.blue, gui = "italic" },
		b = { bg = colors.statusline_bg, fg = colors.white },
		c = { bg = colors.statusline_bg, fg = colors.white },
		x = { bg = colors.statusline_bg, fg = colors.white },
		y = { bg = colors.statusline_bg, fg = colors.pink },
		z = { bg = colors.statusline_bg, fg = colors.white },
	}
	theme.insert = {
		a = { bg = colors.statusline_bg, fg = colors.blue, gui = "italic" },
		b = { bg = colors.statusline_bg, fg = colors.white },
		c = { bg = colors.statusline_bg, fg = colors.white },
		x = { bg = colors.statusline_bg, fg = colors.white },
		y = { bg = colors.statusline_bg, fg = colors.pink },
		z = { bg = colors.statusline_bg, fg = colors.white },
	}
	theme.command = {
		a = { bg = colors.statusline_bg, fg = colors.blue, gui = "italic" },
		b = { bg = colors.statusline_bg, fg = colors.white },
		c = { bg = colors.statusline_bg, fg = colors.white },
		x = { bg = colors.statusline_bg, fg = colors.white },
		y = { bg = colors.statusline_bg, fg = colors.pink },
		z = { bg = colors.statusline_bg, fg = colors.white },
	}
	theme.visual = {
		a = { bg = colors.statusline_bg, fg = colors.blue, gui = "italic" },
		b = { bg = colors.statusline_bg, fg = colors.white },
		c = { bg = colors.statusline_bg, fg = colors.white },
		x = { bg = colors.statusline_bg, fg = colors.white },
		y = { bg = colors.statusline_bg, fg = colors.pink },
		z = { bg = colors.statusline_bg, fg = colors.white },
	}
	theme.replace = {
		a = { bg = colors.statusline_bg, fg = colors.blue, gui = "italic" },
		b = { bg = colors.statusline_bg, fg = colors.white },
		c = { bg = colors.statusline_bg, fg = colors.white },
		x = { bg = colors.statusline_bg, fg = colors.white },
		y = { bg = colors.statusline_bg, fg = colors.pink },
		z = { bg = colors.statusline_bg, fg = colors.white },
	}
	theme.inactive = {
		a = { bg = colors.black, fg = colors.white, gui = "italic" },
		b = { bg = colors.black, fg = colors.white },
		c = { bg = colors.black, fg = colors.white },
		x = { bg = colors.black, fg = colors.white },
		y = { bg = colors.black, fg = colors.white },
		z = { bg = colors.black, fg = colors.white },
	}
	return theme
end

M.def = function()
	local theme = {}
	theme.normal = {
		b = { fg = colors.green, bg = colors.statusline_bg },
		a = { fg = colors.statusline_bg, bg = colors.green, gui = "italic" },
		c = { fg = colors.white, bg = colors.statusline_bg },
	}
	theme.visual = {
		b = { fg = colors.pink, bg = colors.statusline_bg },
		a = { fg = colors.statusline_bg, bg = colors.pink, gui = "italic" },
	}
	theme.inactive = {
		b = { fg = colors.statusline_bg, bg = colors.blue },
		a = { fg = colors.white, bg = colors.grey, gui = "italic" },
	}
	theme.replace = {
		b = { fg = colors.red, bg = colors.statusline_bg },
		a = { fg = colors.statusline_bg, bg = colors.red, gui = "italic" },
		c = { fg = colors.white, bg = colors.statusline_bg },
	}
	theme.insert = {
		b = { fg = colors.blue, bg = colors.statusline_bg },
		a = { fg = colors.statusline_bg, bg = colors.blue, gui = "italic" },
		c = { fg = colors.white, bg = colors.statusline_bg },
	}
	return theme
end

return M
