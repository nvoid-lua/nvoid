local M = {}
M.config = function()
  nvoid.builtin.which_key = {
    ---@usage disable which-key completely [not recommended]
    active = true,
    on_config_done = nil,
    setup = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      icons = {
        breadcrumb = nvoid.icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
        separator = nvoid.icons.ui.BoldArrowRight, -- symbol used between a key and it's label
        group = nvoid.icons.ui.Plus, -- symbol prepended to a group
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
      ignore_missing = false,
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      triggers = "auto", -- automatically setup triggers
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
    },

    opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = true,
    },
    vopts = {
      mode = "v",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = true,
    },
    -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
    -- see https://neovim.io/doc/user/map.html#:map-cmd
    vmappings = {
      ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      },
    },
    mappings = {
      ["/"] = { "<Plug>(comment_toggle_linewise_current)", "/ Comment" },
      [";"] = { "<cmd>Alpha<cr>", nvoid.icons.ui.Lock .. " Alpha" },
      ["b"] = { "<cmd>Telescope buffers<cr>", nvoid.icons.ui.Tab .. " Buffers" },
      ["e"] = { "<cmd>NvimTreeToggle<cr>", nvoid.icons.ui.Explorer .. " Explorer" },
      ["N"] = { "<cmd>enew<cr>", nvoid.icons.ui.NewFile .. " New File" },
      ["w"] = { "<cmd>write<cr>", nvoid.icons.ui.Check .. " Write" },
      ["x"] = { "<cmd>wqa!<cr>", nvoid.icons.ui.SignOut .. " Write and Quit" },
      f = {
        name = " " .. nvoid.icons.ui.Telescope .. " Find",
        b = { "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
        c = { "<cmd>Telescope themes<cr>", "Change Colors" },
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
        name = " " .. nvoid.icons.ui.Octoface .. " Git",
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
        name = " " .. nvoid.icons.ui.Lsp .. " lsp",
        d = { "<cmd>NvoidDiagnostics<cr>", "Diagnostics" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        l = { "<cmd>MasonLog<cr>", "Mason Log" },
        m = { "<cmd>Mason<cr>", "Mason" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        f = { "<cmd>lua require('nvoid.lsp.utils').format()<cr>", "Format" },
      },
      d = {
        name = " " .. nvoid.icons.ui.Bug .. " Debug",
        t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
      },
      p = {
        name = " " .. nvoid.icons.ui.Package .. " Plugins",
        i = { "<cmd>Lazy install<cr>", "Install" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        S = { "<cmd>Lazy clear<cr>", "Status" },
        c = { "<cmd>Lazy clean<cr>", "Clean" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        p = { "<cmd>Lazy profile<cr>", "Profile" },
        l = { "<cmd>Lazy log<cr>", "Log" },
        d = { "<cmd>Lazy debug<cr>", "Debug" },
      },
      n = {
        name = " " .. nvoid.icons.ui.Nvoid .. " Nvoid",
        d = { "<cmd>NvoidDocs<CR>", "Docs" },
        u = { "<cmd>NvoidUpdate<CR>", "Update" },
        e = { "<cmd>edit" .. require("nvoid.config"):get_user_config_path() .. "<CR>", "Edit Config" },
        r = { "<cmd>NvoidReload<CR>", "Reload" },
        i = { "<cmd>NvoidInfo<cr>", "Info" },
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
