-- Diff Source
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

-- LuaLine
local present1, lualine = pcall(require, "lualine")
if not present1 then
	return false
end

-- Colors
local present2, colors = pcall(require, "nvoid.colors")
if not present2 then
	return false
end

-- Conditions
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		component_separators = "",
		section_separators = "",
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		theme = {
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_v = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

-- LEFT

-- vi Color mode
ins_left({
	function()
		return " "
	end,
	color = { fg = colors.bg, bg = colors.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
	function()
		return ""
	end,
	color = { fg = colors.blue, bg = colors.grey }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
	"filename",
	-- cond = conditions.buffer_not_empty,
	color = { fg = colors.white, bg = colors.grey },
})

ins_left({
	function()
		return ""
	end,
	color = { fg = colors.grey, bg = colors.bg }, -- Sets highlighting of component
	padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
	"diff",
	source = diff_source,
	symbols = { added = "  ", modified = "柳", removed = " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	color = {},
	cond = nil,
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.yellow },
		info = { fg = colors.cyan },
	},
	colored = true,
	update_in_insert = false,
})

ins_right({
	function()
		local msg = ""
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " ",
	color = { fg = colors.violet, gui = "bold" },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.blue, bg = colors.bg }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
})

ins_right({
	function()
		return " "
	end,
	color = { fg = colors.bg, bg = colors.blue }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
})

ins_right({
	"b:gitsigns_head",
	color = { fg = colors.blue, bg = colors.grey },
})

ins_right({
	function()
		return ""
	end,
	color = { fg = colors.red, bg = colors.grey }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
})

ins_right({
	function()
		return " "
	end,
	color = { fg = colors.bg, bg = colors.red }, -- Sets highlighting of component
	padding = { left = 0, right = 0 }, -- We don't need space before this
})

ins_right({
	"mode",
	fmt = function(str)
		return str
	end,
	color = { fg = colors.red, bg = colors.grey }, -- Sets highlighting of component
})

lualine.setup(config)
