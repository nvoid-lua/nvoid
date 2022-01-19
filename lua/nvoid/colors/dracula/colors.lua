local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

local colors = {
	white = "#F8F8F2",
	black2 = "#424450",
	bg = "#424450",
	fg = "#F8F8F2",
	one_bg3 = "#565761",
	grey = "#565761",
	grey_fg = "#5a5c68",
	light_grey = "#636571",
	red = "#E95678",
	pink = "#FF79C6",
	green = "#69ff94",
	nord_blue = "#b389ef",
	blue = "#b389ef",
	blue_dark = "#BD93F9",
	yellow = "#F1FA8C",
	purple = "#BD93F9",
	magenta = "#BD93F9",
	violet = "#BD93F9",
	teal = "#0088cc",
	orange = "#FFB86C",
	cyan = "#8BE9FD",
}

return colors
