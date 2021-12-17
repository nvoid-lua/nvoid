if vim.fn.has('nvim-0.5') == 0 then
  error('Need NVIM 0.5 in order to run Nvoid!!')
end

local modules = {
   "plugins",
   "plugins/plugConfig",
   "core",
   "colors"
}

for _, module in ipairs(modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end
