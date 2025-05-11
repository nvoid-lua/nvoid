local M = {}
-- require("ibl").setup {
--     indent = { highlight = highlight, char = "" },
--     whitespace = {
--         highlight = highlight,
--         remove_blankline_trail = false,
--     },
--     scope = { enabled = false },
-- }

M.config = function()
  nvoid.builtin.indentlines = {
    active = true,
    on_config_done = nil,
    options = {
      enabled = true,
      indent = {
        highlight = "WinSeparator",
        char = nvoid.icons.ui.LineLeft,
      },
      scope = {
        enabled = true,
        char = nvoid.icons.ui.LineLeft,
        highlight = "FloatBorder",
        show_start = false,
        show_end = false,
      },
      whitespace = {
        remove_blankline_trail = false,
        highlight = { "FloatBorder", "FloatBorder" },
      },

      exclude = {
        filetypes = {
          "help",
          "startify",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "Trouble",
          "text",
        },
        buftypes = { "terminal", "nofile" },
      }
    },
  }
end

M.setup = function()
  local status_ok, indent_blankline = pcall(require, "ibl")
  if not status_ok then
    return
  end

  indent_blankline.setup(nvoid.builtin.indentlines.options)

  if nvoid.builtin.indentlines.on_config_done then
    nvoid.builtin.indentlines.on_config_done()
  end
end

return M
