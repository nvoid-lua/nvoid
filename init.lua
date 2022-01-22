pcall(require, "custom.nvoidrc")

for _, module in ipairs({ "nvoid" }) do
	local ok = pcall(require, module)
	if not ok then
		return
	end
end
