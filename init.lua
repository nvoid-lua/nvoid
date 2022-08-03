pcall(require, "custom.nvoidrc")
require("nvoid.core.packer").load()
local modules = {
  "nvoid.core",
  "nvoid.core.map"
}

for _, module in ipairs(modules) do
  local ok = pcall(require, module)
  if not ok then
    return
  end
end
