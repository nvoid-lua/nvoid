if vim.fn.has('nvim-0.5') == 0 then
  error('Need NVIM 0.5 in order to run Nvoid!!')
end

local ok, err = pcall(require, 'nvoid')
pcall(require, "nvoidrc")

if not ok then
  -- vim.notify("Error loading core")
  return
end
