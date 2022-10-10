local M = {}
M.config = function()
  nvoid.builtin.which_key = {
    ---@usage disable which-key completely [not recommended]
    active = true,
    on_config_done = nil,
    setup = {
      plugins = {
        marks = true,
        registers = true,
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = true,
          z = true,
          g = true,
        },
        spelling = { enabled = true, suggestions = 20 },
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+ ", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    },

    opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
    -- see https://neovim.io/doc/user/map.html#:map-cmd
    vmappings = {
      ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "蘒Comment toggle linewise (visual)" },
    },
    mappings = {
      ["/"] = { "<Plug>(comment_toggle_linewise_current)", "蘒Comment" },
      [";"] = { "<cmd>Alpha<cr>", " Alpha" },
      ["b"] = { "<cmd>Telescope buffers<cr>", "﬘ Buffers" },
      ["e"] = { "<cmd>NvimTreeToggle<cr>", " Explorer" },
      ["N"] = { "<cmd>enew<cr>", " New File" },
      ["w"] = { "<cmd>write<cr>", " Write" },
      ["x"] = { "<cmd>wqa!<cr>", " Write and Quit" },
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
        l = { "<cmd>MasonLog<cr>", "Mason Log" },
        m = { "<cmd>Mason<cr>", "Mason" },
        r = { "<cmd>NvoidRename<cr>", "Rename" },
        f = { "<cmd>NvoidFormat<cr>", "Format" },
      },
      p = {
        name = " Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },
      n = {
        name = " Nvoid",
        u = { "<cmd>NvoidUpdate<CR>", "ﮮ Update" },
        e = { "<cmd>:e ~/.config/nvoid/config.lua<CR>", " Edit Config" },
        r = { "<cmd>NvoidReload<CR>", "勒Reload" },
        i = { "<cmd>NvoidInfo<cr>", " Info" },
      },
    },
  }
end

M.setup = function()
  local which_key = require "which-key"

  which_key.setup(nvoid.builtin.which_key.setup)

  local opts = nvoid.builtin.which_key.opts
  local vopts = nvoid.builtin.which_key.vopts

  local mappings = nvoid.builtin.which_key.mappings
  local vmappings = nvoid.builtin.which_key.vmappings

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)

  if nvoid.builtin.which_key.on_config_done then
    nvoid.builtin.which_key.on_config_done(which_key)
  end
end

return M
