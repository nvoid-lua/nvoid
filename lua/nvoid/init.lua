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

function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "gn", '<cmd>lua require("cosmic-ui").rename()<cr>')
