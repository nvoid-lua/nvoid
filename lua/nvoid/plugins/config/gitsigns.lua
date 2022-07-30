local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  numhl = false,
  linehl = false,
  keymaps = { noremap = true, buffer = true },
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
}
