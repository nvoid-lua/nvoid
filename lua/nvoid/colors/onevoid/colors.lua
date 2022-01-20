local colorscheme = "onevoid"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
local colors = {
	white = "#abb2bf",
	black = "#1f2227",
	bg = "#282c34",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	purple = "#c678dd",
	pink = "#ff1493",
	blue = "#51afef",
	teal = "#008080",
	grey = "#30343c",
	red = "#ec5f67",
	black2 = "#282c34",
	one_bg3 = "#30343c",
	grey_fg = "#565c64",
	light_grey = "#6f737b",
	nord_blue = "#81A1C1",
	blue_dark = "#5e81ac",
}
return colors
