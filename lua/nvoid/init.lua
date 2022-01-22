local modules = {
	"nvoid.plugins",
	"nvoid.core",
	"nvoid.core.map",
}

for _, module in ipairs(modules) do
	local ok = pcall(require, module)
	if not ok then
		return
	end
end
