local colorscheme = "doom-one"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

local colors = {
	white = "#bbc2cf",
	black = "#282c34", --  nvim bg
	bg = "#21252a",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#46D9FF",
	green = "#98be65",
	orange = "#ea9558",
	purple = "#afa7e7",
	violet = "#afa7e7",
	magenta = "#afa7e7",
	pink = "#ff75a0",
	blue = "#51afef",
	teal = "#4db5bd",
	grey = "#494d55",
	grey_fg = "#53575f",
	light_grey = "#676b73",
	red = "#ff6b5a",
	one_bg3 = "#41454d",
	black2 = "#21252a",
	nord_blue = "#47a5e5",
	blue_dark = "#007acc",
}

return colors
