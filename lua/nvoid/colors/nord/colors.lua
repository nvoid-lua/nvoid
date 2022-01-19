local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
local colors = {
	white = "#abb2bf",
	black = "#2E3440", --  nvim bg
	bg = "#3b4252",
	fg = "#abb2bf",
	one_bg3 = "#494f5b",
	grey = "#4b515d",
	grey_fg = "#565c68",
	light_grey = "#646a76",
	red = "#BF616A",
	pink = "#d57780",
	green = "#A3BE8C",
	blue = "#7797b7",
	blue_dark = "#5E81AC",
	nord_blue = "#81A1C1",
	yellow = "#EBCB8B",
	purple = "#aab1be",
	violet = "#aab1be",
	magenta = "#aab1be",
	teal = "#6484a4",
	orange = "#e39a83",
	cyan = "#9aafe6",
}

return colors
