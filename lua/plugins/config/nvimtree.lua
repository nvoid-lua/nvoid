local g = vim.g

g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1 
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_icon_padding = ' '
g.nvim_tree_symlink_arrow = ' >> '
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_create_in_closed_folder = 0
g.nvim_tree_refresh_wait = 500
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
require'nvim-tree'.setup {
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   auto_close = true,
   open_on_tab = true,
   hijack_cursor = true,
   update_cwd = true,
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
   diagnostics = {
      enable = true,
      icons = {
         hint = "",
         info = "",
         warning = "",
         error = "",
      },
   },

  view = {
    width = 30,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

g.nvim_tree_show_icons = {
    git = 1,
    folder_arrows = 1,
    folders = 1,
    files = 1
}
g.nvim_tree_icons = {
    default = "",
    symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "", -- 
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}
