local present, whichkey = pcall(require, "which-key")
if not present then
  return
end

whichkey.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = { enabled = false, suggestions = 20 },
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
  key_labels = {},
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
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

whichkey.register({
  ["/"] = "Comment",
  [";"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["E"] = { "<cmd>e ~/.config/nvim/lua/custom/nvoidrc.lua<cr>", "Edit Config" },
  ["g"] = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle GitSigns" },
  ["n"] = { "<cmd>enew<cr>", "New File" },
  ["u"] = { "<cmd>NvoidUpdater<cr>", "Update Nvoid" },
  ["w"] = { "<cmd>write<cr>", "Write" },
  ["x"] = { "<cmd>wqa!<cr>", "Write and Quit" },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    k = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineMoveNext<cr>", "Move Next" },
    p = { "<cmd>BufferLineMovePrev<cr>", "Move Previous" },
    c = { "<cmd>Bdelete this<cr>", "close" },
  },
  f = {
    name = "Find",
    t = { "<cmd>Telescope filetypes<cr>", "File Types" },
    b = { "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
    h = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    c = { "<cmd>Telescope themes<cr>", "Colorschemes" },
    o = { "<cmd>Telescope vim_options<cr>", "Options" },
    H = { "<cmd>Telescope help_tags<cr>", "CMD Help" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find Word In Document" },
    k = { "<cmd>Telescope keymaps<cr>", "Key maps" },
    m = { "<cmd>Telescope media_files<cr>", "Media Files" },
  },
  l = {
    name = "lsp",
    a = { "<cmd>NvoidCodeActions<cr>", "Code Actions" },
    A = { "<cmd>NvoidRangeCodeActions<cr>", "Range Code Actions" },
    d = { "<cmd>NvoidDiagnostics<cr>", "Diagnostics" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    r = { "<cmd>NvoidRename<cr>", "Rename" },
    f = { "<cmd>NvoidFormat<cr>", "Format" },
    t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
}, {
  prefix = "<leader>",
})

local opts = { prefix = "<leader>" }
local mappings = require("nvoid.core.utils").load_config().whichkey_add
whichkey.register(mappings, opts)
