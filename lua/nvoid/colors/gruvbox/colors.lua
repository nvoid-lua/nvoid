local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
local colors = {
	white = "#ebdbb2",
	black = "#282828", --  nvim bg
	bg = "#3c3836",
	fg = "#ebdbb2",
	yellow = "#d79921",
	cyan = "#82b3a8",
	green = "#b8bb26",
	orange = "#e78a4e",
    violet = "#b4bbc8",
    magenta = "#b4bbc8",
	purple = "#b4bbc8",
	pink = "#ff75a0",
	blue = "#458588",
	teal = "#749689",
	grey = "#464646",
	red = "#fb4934",
	black2 = "#3c3836",
	one_bg3 = "#444444",
	grey_fg = "#4e4e4e",
	light_grey = "#565656",
	nord_blue = "#83a598",
	blue_dark = "#458588",
}

return colors
