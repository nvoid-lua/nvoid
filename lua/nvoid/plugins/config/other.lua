local M = {}
local colors = require("base16").get()
local icons = require "nvoid.ui.icons"

-- Auto Pairs
M.autopairs = function()
  local present1, autopairs = pcall(require, "nvim-autopairs")
  local present2 = pcall(require, "cmp")
  if not (present1 and present2) then
    return
  end
  local options = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  }
  autopairs.setup(options)
end

-- Commented
M.commented = function()
  require("Comment").setup {
    padding = true,
    ignore = "^$",
    mappings = {
      basic = true,
      extra = false,
    },
    toggler = {
      line = "gcc",
      block = "gbc",
    },
    opleader = {
      line = "gc",
      block = "gb",
    },
    pre_hook = nil,
    post_hook = nil,
  }
end

-- Git Signs
M.git = function()
  local present, gitsigns = pcall(require, "gitsigns")
  if present then
    gitsigns.setup {
      keymaps = { noremap = true, buffer = true },

      signs = {
        add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
        change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
        topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
        changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
      },
    }
  end
end

-- Better Escape
M.better = function()
  local present, better_escape = pcall(require, "better_escape")
  if not present then
    return
  end
  better_escape.setup {
    mapping = { "jk", "kj" },
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
  }
end

M.notify = function()
  require("notify").setup {
    stages = "slide",
    on_open = nil,
    on_close = nil,
    render = "default",
    timeout = 5000,
    background_colour = colors.black,
    minimum_width = 50,
    icons = {
      ERROR = icons.lsp.error,
      WARN = icons.lsp.warn,
      INFO = icons.lsp.info,
      DEBUG = icons.lsp.debug,
      TRACE = "✎",
    },
  }
  local notify = require "notify"
  vim.notify = notify
end

return M
