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
