if vim.fn.has("nvim-0.6") == 0 then
	error("Need NVIM 0.6 in order to run Cosmic!!")
end

pcall(require, "custom.nvoidrc")

for _, module in ipairs({ "nvoid" }) do
	local ok, err = pcall(require, module)
	if not ok then
		return
	end
end
