local function theme_switcher(opts)
	local pickers, finders, actions, action_state, conf
	if pcall(require, "telescope") then
		pickers = require("telescope.pickers")
		finders = require("telescope.finders")
		actions = require("telescope.actions")
		action_state = require("telescope.actions.state")
		conf = require("telescope.config").values
	else
		error("Cannot find telescope!")
	end

	local local_utils = require("nvoid.core.telescope")
	local reload_theme = local_utils.reload_theme
	local themes = local_utils.list_themes()
	if next(themes) ~= nil then
		local current_theme = vim.g.theme
		local theme_new = ""
		local change = false

		local picker = pickers.new({
			prompt_title = "Set color",
			finder = finders.new_table(themes),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function()
				actions.select_default:replace(function(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					theme_new = selection.value
					change = true
					actions.close(prompt_bufnr)
				end)
				return true
			end,
		})
		local close_windows = picker.close_windows
		picker.close_windows = function(status)
			close_windows(status)
			local final_theme
			if change then
				final_theme = theme_new
			else
				final_theme = current_theme
			end
			if reload_theme(final_theme) then
				if change then
					local ans = string.lower(vim.fn.input("Set " .. theme_new .. " as default theme ? [y/N] ")) == "y"
					local_utils.clear_cmdline()
					if ans then
						local_utils.change_theme(current_theme, final_theme)
					else
						final_theme = current_theme
					end
				end
			else
				final_theme = current_theme
			end
			vim.g.theme = final_theme
		end
		picker:find()
	else
		print("No themes found in " .. vim.fn.stdpath("config") .. "/lua/nvoid/colors/hl_themes")
	end
end
local present, telescope = pcall(require, "telescope")
if present then
	return telescope.register_extension({
		exports = {
			themes = theme_switcher,
		},
	})
else
	error("Cannot find telescope!")
end
