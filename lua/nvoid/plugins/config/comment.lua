local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end
comment.setup({
  padding = true,
  ignore = "^$",
  mappings = {
    basic = true,
    extra = false,
  },
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  pre_hook = nil,
  post_hook = nil,
})
