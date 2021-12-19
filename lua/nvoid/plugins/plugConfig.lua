local modules = {
 "nvoid.plugins.config.icons-config",
 "nvoid.plugins.config.statusline",
 "nvoid.plugins.config.bufferline",
 "nvoid.plugins.config.indentline",
 "nvoid.plugins.config.colorizer",
 "nvoid.plugins.config.git",
 "nvoid.plugins.config.treesitter",
 "nvoid.plugins.config.lsp",
 "nvoid.plugins.config.cmp",
 "nvoid.plugins.config.autopairs",
 "nvoid.plugins.config.dashboard",
 "nvoid.plugins.config.nvimtree",
 "nvoid.plugins.config.telescope",
 "nvoid.plugins.config.term",
 "nvoid.plugins.config.which-key",
 "nvoid.plugins.config.trouble",
 "nvoid.plugins.config.comment"
}

for _, module in ipairs(modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end
