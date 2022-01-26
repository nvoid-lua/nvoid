vim.cmd("packadd packer.nvim")

local first_install = false

local present, packer = pcall(require, "packer")

if not present then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
		prompt_border = "single",
	},
	git = {
		clone_timeout = 6000, -- seconds
	},
	auto_clean = true,
	compile_on_sync = true,
})

-- return packer

return {
	packer = packer,
	first_install = first_install,
}
