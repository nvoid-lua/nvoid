local M = {}

function M.config()
  nvoid.builtin.mason = {
    ui = {
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
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    github = {
      download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
  }
end

function M.setup()
  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end
  mason.setup(nvoid.builtin.mason)
end

return M
