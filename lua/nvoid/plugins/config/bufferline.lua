local present1, bufferline = pcall(require, "bufferline")
if not present1 then
  return
end

local icons = require("nvoid.ui.icons").bufferline

bufferline.setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "vert sbuffer %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = icons.indicator,
    buffer_close_icon = icons.buffer_close,
    modified_icon = icons.modified,
    close_icon = icons.close,
    left_trunc_marker = icons.left_marker,
    right_trunc_marker = icons.right_marker,
    name_formatter = function(buf)
      if buf.name:match "%.md" then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    sort_by = "id",
  },
}
