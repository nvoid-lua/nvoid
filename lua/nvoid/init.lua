local modules = {
	"nvoid.plugins",
	"nvoid.core",
	"nvoid.colors",
	"nvoid.core.map",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end
