local M = {}
M.open = function()
  local currName = vim.fn.expand "<cword>" .. " "
  local win = require("plenary.popup").create(currName, {
    title = "| Rename |",
    style = "minimal",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    relative = "cursor",
    borderhighlight = "RenameBorder",
    titlehighlight = "RenameTitle",
    focusable = true,
    width = 25,
    height = 1,
    line = "cursor+2",
    col = "cursor-1",
  })
  local cmd = vim.cmd
  local map = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }
  cmd "normal w"
  cmd "startinsert"
  map(0, "i", "<Esc>", "<cmd>stopinsert | q!<CR>", opts)
  map(0, "n", "<Esc>", "<cmd>stopinsert | q!<CR>", opts)
  map(
    0,
    "i",
    "<CR>",
    "<cmd>stopinsert | lua require'nvoid.ui.rename'.apply(" .. currName .. "," .. win .. ")<CR>",
    opts
  )
  map(
    0,
    "n",
    "<CR>",
    "<cmd>stopinsert | lua require'nvoid.ui.rename'.apply(" .. currName .. "," .. win .. ")<CR>",
    opts
  )
end
M.apply = function(curr, win)
  local new = vim.trim(vim.fn.getline ".")
  vim.api.nvim_win_close(win, true)

  if #new > 0 and new ~= curr then
    local params_pos = vim.lsp.util.make_position_params()
    params_pos.new = new

    vim.lsp.buf_request(0, "textDocument/rename", params_pos)
  end
end
return M
