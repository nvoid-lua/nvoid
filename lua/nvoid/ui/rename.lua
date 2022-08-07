local M = {}
M.open = function()
  local currName = vim.fn.expand "<cword>" .. " "
  local win = require("plenary.popup").create(currName, {
    title = "| Rename |",
    style = "minimal",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    relative = "cursor",
    borderhighlight = "RenamerBorder",
    titlehighlight = "RenamerTitle",
    focusable = true,
    width = 25,
    height = 1,
    line = "cursor+2",
    col = "cursor-1",
  })
  local map = vim.api.nvim_buf_set_keymap
  local map_opts = { noremap = true, silent = true }
  local Rename = "stopinsert | lua require'nvoid.ui.rename'.apply(" .. currName .. "," .. win .. ")"
  vim.cmd "normal w"
  vim.cmd "startinsert"
  map(0, "i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
  map(0, "n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
  map(0, "i", "<CR>", "<cmd>" .. Rename .. "<CR>", map_opts)
  map(0, "n", "<CR>", "<cmd>" .. Rename .. "<CR>", map_opts)
end
M.apply = function(curr, win)
  local newName = vim.trim(vim.fn.getline ".")
  vim.api.nvim_win_close(win, true)
  if #newName > 0 and newName ~= curr then
    local params = vim.lsp.util.make_position_params()
    params.newName = newName
    vim.lsp.buf_request(0, "textDocument/rename", params)
  end
end
return M
