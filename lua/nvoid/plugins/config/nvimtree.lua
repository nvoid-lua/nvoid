local M = {}
local Log = require "nvoid.core.log"
local icons = require("nvoid.interface.icons")

function M.config()
  nvoid.builtin.nvimtree = {
    active = true,
    on_config_done = nil,
    setup = {
      auto_reload_on_write = true,
      disable_netrw = true,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      diagnostics = {
        enable = true,
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
        enable = true,
        ignore = false,
        timeout = 200,
      },
      view = {
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        mappings = {
          custom_only = false,
          list = {},
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
      renderer = {
        indent_markers = {
          enable = false,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        root_folder_modifier = ":t",
        highlight_git = true,
        icons = { glyphs = icons.nvimtree }
      },
      sort_by = "name",
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = false,
      system_open = {
        cmd = nil,
        args = {},
      },
      filters = {
        dotfiles = false,
        custom = { "node_modules", "\\.cache", "^.git$" },
        exclude = {},
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
        },
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = false,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
    },
  }
end

function M.start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode] {
    cwd = basedir,
  }
end

function M.setup()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")

  if not status_ok then
    Log:error "Failed to load nvim-tree"
    return
  end

  -- Add useful keymaps
  local function telescope_find_files(_)
    require("nvoid.plugins.config.nvimtree").start_telescope "find_files"
  end

  local function telescope_live_grep(_)
    require("nvoid.plugins.config.nvimtree").start_telescope "live_grep"
  end

  if #nvoid.builtin.nvimtree.setup.view.mappings.list == 0 then
    nvoid.builtin.nvimtree.setup.view.mappings.list = {
      { key = { "l", "<CR>", "o" }, action = "edit",                 mode = "n" },
      { key = "h",                  action = "close_node" },
      { key = "v",                  action = "vsplit" },
      { key = "C",                  action = "cd" },
      { key = "gtf",                action = "telescope_find_files", action_cb = telescope_find_files },
      { key = "gtg",                action = "telescope_live_grep",  action_cb = telescope_live_grep },
    }
  end

  nvim_tree.setup(nvoid.builtin.nvimtree.setup)

  if nvoid.builtin.nvimtree.on_config_done then
    nvoid.builtin.nvimtree.on_config_done(nvim_tree)
  end
end

return M
