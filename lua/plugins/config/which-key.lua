require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
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
    border = "double", -- none, single, double, shadow
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
  ["r"] = "Ranger",
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
    f = "Files",
    h = "Old Files",
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
  },
  p = {
    name = "Packer",
    i = "Install",
    c = "Clean",
    s = "Sync"
  },

}, {
  prefix = "<leader>",
})
