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
    breadcrumb = "» ",
    separator = "➜ ",
    group = "+ ",
  },
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 1, 1, 1 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

require("which-key").register({
  ["d"] = "Start Screen",
  ["/"] = "Comment",
  ["e"] = "NvimTree",
  ["E"] = "Edit Config",
  ["m"] = "Messages",
  ["w"] = "Write",
  ["x"] = "Write and Quit",
  ["q"] = "Quit",
  b = {
    name = "Buffers",
    j = "Next",
    k = "Previous",
    n = "Move Next",
    p = "Move Previous",
    c = "close"
  },
  f = {
    name = "Find",
    b = "File Browser",
    h = "History",
    f = "Find File",
    c = "ColorScheme With Preview",
    t = "Treesitter Symbols",
    o = "Options",
    H = "CMD Help",
    w = "Find Word In Document",
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
    u = "Update",
  },

}, {
  prefix = "<leader>",
})
