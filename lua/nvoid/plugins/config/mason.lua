local M = {}

local join_paths = require("nvoid.utils").join_paths

function M.config()
  nvoid.builtin.mason = {
    ui = {
      check_outdated_packages_on_open = true,
      width = 0.8,
      height = 0.9,
      keymaps = {
        toggle_package_expand = "<CR>",
        install_package = "i",
        update_package = "u",
        check_package_version = "c",
        update_all_packages = "U",
        check_outdated_packages = "C",
        uninstall_package = "X",
        cancel_installation = "<C-c>",
        apply_language_filter = "<C-f>",
      },
    },

    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },

    install_root_dir = join_paths(vim.fn.stdpath "data", "mason"),

    PATH = "skip",

    pip = {
      upgrade_pip = false,
      install_args = {},
    },

    log_level = vim.log.levels.INFO,

    max_concurrent_installers = 4,

    registries = {
      "lua:mason-registry.index",
      "github:mason-org/mason-registry",
    },
    providers = {
      "mason.providers.registry-api",
      "mason.providers.client",
    },

    github = {
      download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },

    on_config_done = nil,
  }
end

function M.get_prefix()
  local default_prefix = join_paths(vim.fn.stdpath "data", "mason")
  return vim.tbl_get(nvoid.builtin, "mason", "install_root_dir") or default_prefix
end

local function add_to_path(append)
  local p = join_paths(M.get_prefix(), "bin")
  if vim.env.PATH:match(p) then
    return
  end
  local string_separator = vim.loop.os_uname().version:match "Windows" and ";" or ":"
  if append then
    vim.env.PATH = vim.env.PATH .. string_separator .. p
  else
    vim.env.PATH = p .. string_separator .. vim.env.PATH
  end
end

function M.bootstrap()
  add_to_path()
end

function M.setup()
  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end

  add_to_path(nvoid.builtin.mason.PATH == "append")

  mason.setup(nvoid.builtin.mason)

  if nvoid.builtin.mason.on_config_done then
    nvoid.builtin.mason.on_config_done(mason)
  end
end

return M
