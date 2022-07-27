local present1, bufferline = pcall(require, "bufferline")
if not present1 then
  return
end

local colors = require("base16").get()
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
  highlights = {
    background = {
      guifg = colors.grey_fg,
      guibg = colors.black2,
    },

    -- buffers
    buffer_selected = {
      guifg = colors.white,
      guibg = colors.black,
      gui = "bold",
    },
    buffer_visible = {
      guifg = colors.light_grey,
      guibg = colors.black2,
    },

    -- for diagnostics = "nvim_lsp"
    error = {
      guifg = colors.light_grey,
      guibg = colors.black2,
    },
    error_diagnostic = {
      guifg = colors.light_grey,
      guibg = colors.black2,
    },

    -- close buttons
    close_button = {
      guifg = colors.light_grey,
      guibg = colors.black2,
    },
    close_button_visible = {
      guifg = colors.light_grey,
      guibg = colors.black2,
    },
    close_button_selected = {
      guifg = colors.red,
      guibg = colors.black,
    },
    fill = {
      guifg = colors.grey_fg,
      guibg = colors.black2,
    },
    indicator_selected = {
      guifg = colors.blue,
      guibg = colors.black,
    },

    -- modified
    modified = {
      guifg = colors.red,
      guibg = colors.black2,
    },
    modified_visible = {
      guifg = colors.red,
      guibg = colors.black2,
    },
    modified_selected = {
      guifg = colors.green,
      guibg = colors.black,
    },

    -- separators
    separator = {
      guifg = colors.black2,
      guibg = colors.black2,
    },
    separator_visible = {
      guifg = colors.black2,
      guibg = colors.black2,
    },
    separator_selected = {
      guifg = colors.black2,
      guibg = colors.black2,
    },

    -- tabs
    tab = {
      guifg = colors.light_grey,
      guibg = colors.one_bg3,
    },
    tab_selected = {
      guifg = colors.black2,
      guibg = colors.nord_blue,
    },
    tab_close = {
      guifg = colors.red,
      guibg = colors.black,
    },
  },
}
