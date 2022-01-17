local modules = {
	"nvoid.plugins",
	"nvoid.core",
	"nvoid.colors",
	"nvoid.core.map",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, module)
	if not ok then
		return
	end
end
