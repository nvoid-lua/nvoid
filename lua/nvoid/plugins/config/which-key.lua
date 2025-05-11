local M = {}
M.config = function()
  nvoid.builtin.which_key = {
    ---@usage disable which-key completely [not recommended]
    active = true,
    on_config_done = nil,
    setup = {
      plugins = {
        marks = true,     -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,    -- adds help for operators like d, y, ...
          motions = false,      -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false,      -- default bindings on <c-w>
          nav = true,           -- misc bindings to work with windows
          z = true,             -- bindings for folds, spelling and others prefixed with z
          g = true,             -- bindings for prefixed with g
        },
      },
      icons = {
        breadcrumb = nvoid.icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
        separator = nvoid.icons.ui.BoldArrowRight,      -- symbol used between a key and it's label
        group = nvoid.icons.ui.Plus,                    -- symbol prepended to a group
        keys = nil
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
        align = "left",                 -- align columns left, center or right
      },
      show_help = true,                 -- show help message on the command line when the popup is visible
      show_keys = true,                 -- show the currently pressed key and its label as a message in the command line
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
      { "<leader>/",  "<Plug>(comment_toggle_linewise_visual)", desc = "Comment (Visual)" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    },
    mappings = {
      -- Group declarations
      { "<leader>f",  group = "Find" },
      { "<leader>g",  group = "Git" },
      { "<leader>l",  group = "LSP" },
      { "<leader>d",  group = "Debug" },
      { "<leader>p",  group = "Plugins" },
      { "<leader>n",  group = "Nvoid" },

      -- Top-level keymaps
      { "<leader>/",  "<Plug>(comment_toggle_linewise_current)",                                         desc = "Toggle Comment" },
      { "<leader>;",  "<cmd>Alpha<cr>",                                                                  desc = "Dashboard" },
      { "<leader>b",  "<cmd>Telescope buffers<cr>",                                                      desc = "Buffers" },
      { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                                                         desc = "Explorer" },
      { "<leader>N",  "<cmd>enew<cr>",                                                                   desc = "New File" },
      { "<leader>w",  "<cmd>write<cr>",                                                                  desc = "Write File" },
      { "<leader>x",  "<cmd>wqa!<cr>",                                                                   desc = "Save & Quit" },

      -- Find group
      { "<leader>fb", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>",        desc = "File Browser" },
      { "<leader>fc", "<cmd>Telescope themes<cr>",                                                       desc = "Change Colors" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>",                                                   desc = "Find Files" },
      { "<leader>fh", "<cmd>Telescope oldfiles<cr>",                                                     desc = "Old Files" },
      { "<leader>fH", "<cmd>Telescope help_tags<cr>",                                                    desc = "Help Tags" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",                                                      desc = "Keymaps" },
      { "<leader>fm", "<cmd>Telescope media_files<cr>",                                                  desc = "Media Files" },
      { "<leader>fo", "<cmd>Telescope vim_options<cr>",                                                  desc = "Vim Options" },
      { "<leader>ft", "<cmd>Telescope filetypes<cr>",                                                    desc = "File Types" },
      { "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>",                                    desc = "Search Buffer" },

      -- Git group
      { "<leader>gg", "<cmd>Gitsigns toggle_signs<cr>",                                                  desc = "Toggle GitSigns" },
      { "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<cr>",                                    desc = "Next Hunk" },
      { "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<cr>",                                    desc = "Prev Hunk" },
      { "<leader>gl", "<cmd>lua require('gitsigns').blame_line()<cr>",                                   desc = "Blame" },
      { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>",                                 desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>",                                   desc = "Reset Hunk" },
      { "<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<cr>",                                 desc = "Reset Buffer" },
      { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>",                                   desc = "Stage Hunk" },

      -- LSP group
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                          desc = "Code Action" },
      { "<leader>ld", "<cmd>NvoidDiagnostics<cr>",                                                       desc = "Diagnostics" },
      { "<leader>li", "<cmd>LspInfo<cr>",                                                                desc = "Info" },
      { "<leader>ll", "<cmd>MasonLog<cr>",                                                               desc = "Mason Log" },
      { "<leader>lm", "<cmd>Mason<cr>",                                                                  desc = "Mason" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                                               desc = "Rename" },
      { "<leader>lf", "<cmd>lua require('nvoid.lsp.utils').format()<cr>",                                desc = "Format" },

      -- Debug group
      { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>",                                   desc = "Toggle Breakpoint" },
      { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>",                                           desc = "Step Back" },
      { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",                                            desc = "Continue" },
      { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>",                                       desc = "Run to Cursor" },
      { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>",                                          desc = "Disconnect" },
      { "<leader>dg", "<cmd>lua require'dap'.session()<cr>",                                             desc = "Session" },
      { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",                                           desc = "Step Into" },
      { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",                                           desc = "Step Over" },
      { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>",                                            desc = "Step Out" },
      { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>",                                               desc = "Pause" },
      { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>",                                         desc = "Toggle REPL" },
      { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>",                                            desc = "Start" },
      { "<leader>dq", "<cmd>lua require'dap'.close()<cr>",                                               desc = "Quit Debug" },
      { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>",                              desc = "Toggle UI" },

      -- Plugin group
      { "<leader>pi", "<cmd>Lazy install<cr>",                                                           desc = "Install" },
      { "<leader>ps", "<cmd>Lazy sync<cr>",                                                              desc = "Sync" },
      { "<leader>pS", "<cmd>Lazy clear<cr>",                                                             desc = "Status" },
      { "<leader>pc", "<cmd>Lazy clean<cr>",                                                             desc = "Clean" },
      { "<leader>pu", "<cmd>Lazy update<cr>",                                                            desc = "Update" },
      { "<leader>pp", "<cmd>Lazy profile<cr>",                                                           desc = "Profile" },
      { "<leader>pl", "<cmd>Lazy log<cr>",                                                               desc = "Log" },
      { "<leader>pd", "<cmd>Lazy debug<cr>",                                                             desc = "Debug" },

      -- Nvoid group
      { "<leader>nd", "<cmd>NvoidDocs<CR>",                                                              desc = "Docs" },
      { "<leader>nu", "<cmd>NvoidUpdate<CR>",                                                            desc = "Update" },
      { "<leader>ne", function() vim.cmd("edit " .. require("nvoid.config"):get_user_config_path()) end, desc = "Edit Config" },
      { "<leader>nr", "<cmd>NvoidReload<CR>",                                                            desc = "Reload" },
      { "<leader>ni", "<cmd>NvoidInfo<cr>",                                                              desc = "Info" },
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

  which_key.add(mappings, opts)
  which_key.add({ mode = "v", vmappings, vopts })

  if nvoid.builtin.which_key.on_config_done then
    nvoid.builtin.which_key.on_config_done(which_key)
  end
end

return M
