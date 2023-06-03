local M = {}
local Log = require "nvoid.core.log"

function M.config()
  nvoid.builtin.nvimtree = {
    active = true,
    on_config_done = nil,
    setup = {
      auto_reload_on_write = false,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      sort_by = "name",
      root_dirs = {},
      prefer_startup_root = false,
      sync_root_with_cwd = true,
      reload_on_bufenter = false,
      respect_buf_cwd = false,
      on_attach = "default",
      remove_keymaps = false,
      select_prompts = false,
      view = {
        adaptive_size = false,
        centralize_selection = true,
        width = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        float = {
          enable = false,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 30,
            height = 30,
            row = 1,
            col = 1,
          },
        },
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        root_folder_label = ":t",
        indent_width = 2,
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        icons = {
          webdev_colors = nvoid.use_icons,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = nvoid.use_icons,
            folder = nvoid.use_icons,
            folder_arrow = nvoid.use_icons,
            git = nvoid.use_icons,
          },
          glyphs = {
            default = nvoid.icons.ui.Text,
            symlink = nvoid.icons.ui.FileSymlink,
            bookmark = nvoid.icons.ui.BookMark,
            folder = {
              arrow_closed = nvoid.icons.ui.TriangleShortArrowRight,
              arrow_open = nvoid.icons.ui.TriangleShortArrowDown,
              default = nvoid.icons.ui.Folder,
              open = nvoid.icons.ui.FolderOpen,
              empty = nvoid.icons.ui.EmptyFolder,
              empty_open = nvoid.icons.ui.EmptyFolderOpen,
              symlink = nvoid.icons.ui.FolderSymlink,
              symlink_open = nvoid.icons.ui.FolderOpen,
            },
            git = {
              unstaged = nvoid.icons.git.FileUnstaged,
              staged = nvoid.icons.git.FileStaged,
              unmerged = nvoid.icons.git.FileUnmerged,
              renamed = nvoid.icons.git.FileRenamed,
              untracked = nvoid.icons.git.FileUntracked,
              deleted = nvoid.icons.git.FileDeleted,
              ignored = nvoid.icons.git.FileIgnored,
            },
          },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
      },
      hijack_directories = {
        enable = false,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
      },
      diagnostics = {
        enable = nvoid.use_icons,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = nvoid.icons.diagnostics.BoldHint,
          info = nvoid.icons.diagnostics.BoldInformation,
          warning = nvoid.icons.diagnostics.BoldWarning,
          error = nvoid.icons.diagnostics.BoldError,
        },
      },
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "node_modules", "\\.cache" },
        exclude = {},
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 200,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        expand_all = {
          max_folder_discovery = 300,
          exclude = {},
        },
        file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = "cursor",
            border = "shadow",
            style = "minimal",
          },
        },
        open_file = {
          quit_on_open = false,
          resize_window = false,
          window_picker = {
            enable = true,
            picker = "default",
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        remove_file = {
          close_window = true,
        },
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },
      tab = {
        sync = {
          open = false,
          close = false,
          ignore = {},
        },
      },
      notify = {
        threshold = vim.log.levels.INFO,
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          dev = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
      },
      system_open = {
        cmd = nil,
        args = {},
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

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function telescope_find_files(_)
    require("nvoid.core.nvimtree").start_telescope "find_files"
  end

  local function telescope_live_grep(_)
    require("nvoid.core.nvimtree").start_telescope "live_grep"
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  local useful_keys = {
    ["l"] = { api.node.open.edit, opts "Open" },
    ["o"] = { api.node.open.edit, opts "Open" },
    ["<CR>"] = { api.node.open.edit, opts "Open" },
    ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
    ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },
    ["C"] = { api.tree.change_root_to_node, opts "CD" },
    ["gtg"] = { telescope_live_grep, opts "Telescope Live Grep" },
    ["gtf"] = { telescope_find_files, opts "Telescope Find File" },
  }

  require("nvoid.keymappings").load_mode("n", useful_keys)
end

function M.setup()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")

  if not status_ok then
    Log:error "Failed to load nvim-tree"
    return
  end
  -- Add useful keymaps
  if nvoid.builtin.nvimtree.setup.on_attach == "default" then
    nvoid.builtin.nvimtree.setup.on_attach = on_attach
  end

  nvim_tree.setup(nvoid.builtin.nvimtree.setup)

  if nvoid.builtin.nvimtree.on_config_done then
    nvoid.builtin.nvimtree.on_config_done(nvim_tree)
  end
end

return M
