------ impatient ------
vim.defer_fn(function()
  require("nvoid.builtin.impatient")
end, 0)

------ terminal ------
vim.schedule_wrap(require("nvoid.builtin.terminal").init())
