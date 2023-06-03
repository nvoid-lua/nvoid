local M = {}

M.config = function()
  nvoid.builtin.indentlines = {
    active = true,
    on_config_done = nil,
    options = {
      enabled = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "text",
      },
      char = nvoid.icons.ui.LineLeft,
      context_char = nvoid.icons.ui.LineLeft,
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      use_treesitter = true,
      show_current_context = true,
    },
  }
end

M.setup = function()
  local status_ok, indent_blankline = pcall(require, "indent_blankline")
  if not status_ok then
    return
  end

  indent_blankline.setup(nvoid.builtin.indentlines.options)

  if nvoid.builtin.indentlines.on_config_done then
    nvoid.builtin.indentlines.on_config_done()
  end
end

return M
