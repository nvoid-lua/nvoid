local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end
local icons = require("ui.icons")
local config = require("nvoid.core.utils").load_config().plugins.nvimtree

nvim_tree.setup({
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  diagnostics = {
    show_on_dirs = false,
    icons = {
      hint = icons.lsp.hint,
      info = icons.lsp.info,
      warning = icons.lsp.warn,
      error = icons.lsp.error,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = config.git,
    ignore = false,
    timeout = 200,
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
  },
  renderer = {
    indent_markers = {
      enable = config.indent_markers,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    root_folder_modifier = ":t",
    highlight_git = true,
    icons = {
      glyphs = icons.nvimtree,
    },
  },
  filters = { custom = { "^.git$" }, exclude = { vim.fn.stdpath("config") .. "/lua/custom" } },
})
