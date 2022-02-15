local cp = require("nvoid.colors").get()
local theme = {}

theme.normal = {
	a = { bg = cp.statusline_bg, fg = cp.blue, gui = "italic" },
	b = { bg = cp.statusline_bg, fg = cp.white },
	c = { bg = cp.statusline_bg, fg = cp.white },
	x = { bg = cp.statusline_bg, fg = cp.white },
	y = { bg = cp.statusline_bg, fg = cp.pink },
	z = { bg = cp.statusline_bg, fg = cp.white },
}

theme.insert = {
	a = { bg = cp.statusline_bg, fg = cp.blue, gui = "italic" },
	b = { bg = cp.statusline_bg, fg = cp.white },
	c = { bg = cp.statusline_bg, fg = cp.white },
	x = { bg = cp.statusline_bg, fg = cp.white },
	y = { bg = cp.statusline_bg, fg = cp.pink },
	z = { bg = cp.statusline_bg, fg = cp.white },
}

theme.command = {
	a = { bg = cp.statusline_bg, fg = cp.blue, gui = "italic" },
	b = { bg = cp.statusline_bg, fg = cp.white },
	c = { bg = cp.statusline_bg, fg = cp.white },
	x = { bg = cp.statusline_bg, fg = cp.white },
	y = { bg = cp.statusline_bg, fg = cp.pink },
	z = { bg = cp.statusline_bg, fg = cp.white },
}

theme.visual = {
	a = { bg = cp.statusline_bg, fg = cp.blue, gui = "italic" },
	b = { bg = cp.statusline_bg, fg = cp.white },
	c = { bg = cp.statusline_bg, fg = cp.white },
	x = { bg = cp.statusline_bg, fg = cp.white },
	y = { bg = cp.statusline_bg, fg = cp.pink },
	z = { bg = cp.statusline_bg, fg = cp.white },
}

theme.replace = {
	a = { bg = cp.statusline_bg, fg = cp.blue, gui = "italic" },
	b = { bg = cp.statusline_bg, fg = cp.white },
	c = { bg = cp.statusline_bg, fg = cp.white },
	x = { bg = cp.statusline_bg, fg = cp.white },
	y = { bg = cp.statusline_bg, fg = cp.pink },
	z = { bg = cp.statusline_bg, fg = cp.white },
}

theme.inactive = {
	a = { bg = cp.statusline_bg, fg = cp.white, gui = "italic" },
	b = { bg = cp.statusline_bg, fg = cp.white },
	c = { bg = cp.statusline_bg, fg = cp.white },
	x = { bg = cp.statusline_bg, fg = cp.white },
	y = { bg = cp.statusline_bg, fg = cp.white },
	z = { bg = cp.statusline_bg, fg = cp.white },
}

return theme
