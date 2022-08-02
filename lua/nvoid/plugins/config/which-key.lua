local present, wk = pcall(require, "which-key")
if not present then
  return
end
local icons = require("nvoid.ui.icons").whick_key

wk.setup {
  plugins = {
    marks = true,
    registers = true,
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
    spelling = { enabled = false, suggestions = 20 },
  },
  icons = icons,
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 1, 1, 1, 1 },
    winblend = 0,
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

-- Visual Mode
wk.register({
  ["<leader>"] = {
    ["/"] = { "<ESC><CMD>NvoidCommentV<CR>", "蘒Comment" },
  },
}, { mode = "v" })

-- Normal Mode
wk.register({
  ["/"] = { "<cmd>NvoidComment<cr>", "蘒Comment" },
  [";"] = { "<cmd>Alpha<cr>", " Alpha" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", " Explorer" },
  ["E"] = { "<cmd>NvoidEditConfig<cr>", " Edit Config" },
  ["n"] = { "<cmd>enew<cr>", " New File" },
  ["u"] = { "<cmd>NvoidUpdater<cr>", "ﮮ Update Nvoid" },
  ["w"] = { "<cmd>write<cr>", " Write" },
  ["x"] = { "<cmd>wqa!<cr>", " Write and Quit" },
  b = {
    name = "﬘ Buffers",
    c = { "<cmd>bdelete %<cr>", "close" },
    e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
    j = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    k = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineMoveNext<cr>", "Move Next" },
    p = { "<cmd>BufferLineMovePrev<cr>", "Move Previous" },
  },
  f = {
    name = " Find",
    b = { "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    h = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    H = { "<cmd>Telescope help_tags<cr>", "CMD Help" },
    k = { "<cmd>Telescope keymaps<cr>", "Key maps" },
    m = { "<cmd>Telescope media_files<cr>", "Media Files" },
    o = { "<cmd>Telescope vim_options<cr>", "Options" },
    t = { "<cmd>Telescope filetypes<cr>", "File Types" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find Word In Document" },
  },
  g = {
    name = " Git",
    g = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle GitSigns" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  },
  l = {
    name = "力lsp",
    d = { "<cmd>NvoidDiagnostics<cr>", "Diagnostics" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    r = { "<cmd>NvoidRename<cr>", "Rename" },
    f = { "<cmd>NvoidFormat<cr>", "Format" },
    t = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
  },
  p = {
    name = " Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
}, {
  prefix = "<leader>",
})

-- Load Mappings
local opts = { prefix = "<leader>" }
local mappings = require("nvoid.core.utils").load_config().whichkey_add
wk.register(mappings, opts)
