local modules = {
  -- "nvoid.plugins.packerLoad",
  "nvoid.core",
  "nvoid.core.map",
}

for _, module in ipairs(modules) do
  local ok = pcall(require, module)
  if not ok then
    return
  end
end

require("nvoid.packer").load()
