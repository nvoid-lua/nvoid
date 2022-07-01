local M = {}

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
  local present, commented = pcall(require, "commented")
  if not present then
    return
  end
  commented.setup {
    keybindings = { n = "<leader>/", v = "<leader>/", nl = "<leader>/" },
    comment_padding = " ",
  }
end

-- Git Signs
M.git = function()
  local present, gitsigns = pcall(require, "gitsigns")
  if present then
    gitsigns.setup {
      keymaps = { noremap = true, buffer = true },
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = "▎",
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = "▎",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = "契",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = "契",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = "▎",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
    }
  end
end

-- colorizer
M.colorizer = function()
  local present, colorizer = pcall(require, "colorizer")
  if present then
    colorizer.setup({ "*" }, {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = false,
      rgb_fn = false,
      hsl_fn = false,
      css = false,
      css_fn = false,
      mode = "background",
    })
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

-- CMP Icons
M.icons = {
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
}

M.notify = function()
  local present, notify = pcall(require, "notify")
  if not present then
    return
  end
  vim.notify = notify
  notify.setup {
    stages = "slide",
    on_open = nil,
    on_close = nil,
    render = "default",
    timeout = 5000,
    background_colour = "Normal",
    minimum_width = 50,
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  }
end

return M
