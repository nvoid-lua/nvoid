local status, fterm = pcall(require, "FTerm")
if not status then
  return
end

fterm.setup({
  border = "single",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

-- Example keybindings
vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
