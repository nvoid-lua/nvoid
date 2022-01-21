local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true

-- Load the colorscheme
vim.cmd([[colorscheme tokyonight]])

local colors = {
	white = "#c0caf5",
	black = "#1A1B26", --  nvim bg
	black2 = "#292E42",
	bg = "#1f2335",
	fg = "#c0caf5",
	one_bg3 = "#353b45",
	grey = "#40486a",
	grey_fg = "#4a5274",
	light_grey = "#545c7e",
	red = "#f7768e",
	pink = "#ff75a0",
	green = "#9ece6a",
	nord_blue = "#80a8fd",
	blue = "#7aa2f7",
	blue_dark = "#3d59a1",
	yellow = "#e7c787",
	purple = "#bb9af7",
	magenta = "#9d7cd8",
	violet = "#9d7cd8",
	teal = "#0db9d7",
	orange = "#ff9e64",
	cyan = "#7dcfff",
}

return colors
