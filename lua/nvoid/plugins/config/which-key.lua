local present, whichkey = pcall(require, "which-key")

if not present then
   return
end


whichkey.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
  },
  icons = {
    breadcrumb = "» ", -- symbol used in the command line area that shows your active key combo
    separator = "➜ ", -- symbol used between a key and it's label
    group = "+ ", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 2, 2, 2, 2 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

require("which-key").register({
  ["/"] = "Comment",
  ["e"] = "NvimTree",
  ["E"] = "Edit Config",
  ["m"] = "Messages",
  ["w"] = "Write",
  ["x"] = "Write and Quit",
  ["n"] = "New File",
  b = {
    name = "Buffers",
    j = "Next",
    k = "Previous",
    n = "Move Next",
    p = "Move Previous",
    c = "close"
  },
  f = {
    name = "+Find",
    c = "Colorschemes",
    f = "Find File",
    h = "Old Files",
    n = "New File",
  },
  g = {
    name = "Git",
    g = "Toggle Signs",
    j = "Next Hunk",
    k = "Previous Hunk",
    l = "Blame",
    s = "Status",
    c = "Commits",
    S = "Stage",
    U = "Unstage"
  },
  t = {
    name = "Terminal",
    s = "Toggle Split",
    g = "LazyGit",
    h = "htop",
    t = "Toggle",
    p = "Python",
    n = "Ncdu",
  },
  s = {
    name = "Session",
    s = "Save",
    l = "Load"
  },
  l = {
    name = "lsp",
    D = "Document Diagnostic",
    d = "Diagnostics",
    h = "Highlight",
    i = "Info",
    I = "Installer Info",
    r = "Rename",
    c = "Compile Suckless",
    t = "Trouble Toggle in doc",
    T = "Trouble Toggle",
  },
  p = {
    name = "Packer",
    i = "Install",
    c = "Clean",
    s = "Sync",
    C = "Compile",
    S = "Status",
  },

}, {
  prefix = "<leader>",
})
