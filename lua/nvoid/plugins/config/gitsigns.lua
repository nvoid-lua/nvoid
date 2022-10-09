local M = {}

M.config = function()
  nvoid.builtin.gitsigns = {
    active = true,
    on_config_done = nil,
    opts = {
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      numhl = false,
      linehl = false,
      keymaps = {
        noremap = true,
        buffer = true,
      },
      signcolumn = true,
      word_diff = false,
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false,
      },
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      sign_priority = 6,
      update_debounce = 200,
      status_formatter = nil,
      yadm = { enable = false },
    },
  }
end

M.setup = function()
  local gitsigns = require "gitsigns"
  gitsigns.setup(nvoid.builtin.gitsigns.opts)
  if nvoid.builtin.gitsigns.on_config_done then
    nvoid.builtin.gitsigns.on_config_done(gitsigns)
  end
end

return M
