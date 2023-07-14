local core_plugins = {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
  },
  {
    "nvoid-lua/base16",
    build = function()
      require("base16").load_all_highlights()
    end,
    config = function()
      dofile(vim.g.base16_cache .. "syntax")
      dofile(vim.g.base16_cache .. "defaults")
    end
  },
  {
    "nvoid-lua/bufferline.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      dofile(vim.g.base16_cache .. "bufferline")
      require("nvoid.plugins.config.bufferline").setup()
    end,
    enabled = nvoid.builtin.bufferline.active,
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    enabled = nvoid.ui.winbar or false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
    config = function()
      require("mason-lspconfig").setup(nvoid.lsp.installer.setup)

      -- automatic_installation is handled by lsp-manager
      local settings = require "mason-lspconfig.settings"
      settings.current.automatic_installation = false
    end,
    lazy = true,
    event = "User FileOpened",
    dependencies = "mason.nvim",
  },
  { "tamago324/nlsp-settings.nvim",    cmd = "LspSettings", lazy = true },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true },
  {
    "williamboman/mason.nvim",
    config = function()
      require("nvoid.plugins.config.mason").setup()
    end,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    build = function()
      pcall(function()
        require("mason-registry").refresh()
      end)
    end,
    event = "User FileOpened",
    lazy = true,
  },

  { "nvim-lua/plenary.nvim",    cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
      dofile(vim.g.base16_cache .. "telescope")
      require("nvoid.plugins.config.telescope").setup()
    end,
    lazy = true,
    cmd = "Telescope",
    enabled = nvoid.builtin.telescope.active,
  },
  -- Install nvim-cmp, and buffer source as a dependency
  {
    "hrsh7th/nvim-cmp",
    config = function()
      if nvoid.builtin.cmp then
        dofile(vim.g.base16_cache .. "cmp")
        require("nvoid.plugins.config.cmp").setup()
      end
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "cmp-nvim-lsp",
      "cmp_luasnip",
      "cmp-buffer",
      "cmp-path",
      "cmp-cmdline",
    },
  },
  { "hrsh7th/cmp-nvim-lsp",     lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  { "hrsh7th/cmp-buffer",       lazy = true },
  { "hrsh7th/cmp-path",         lazy = true },
  {
    "hrsh7th/cmp-cmdline",
    lazy = true,
    enabled = nvoid.builtin.cmp and nvoid.builtin.cmp.cmdline.enable or false,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local utils = require "nvoid.utils"
      local paths = {}
      if nvoid.builtin.luasnip.sources.friendly_snippets then
        paths[#paths + 1] = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "friendly-snippets")
      end
      local user_snippets = utils.join_paths(get_config_dir(), "snippets")
      if utils.is_directory(user_snippets) then
        paths[#paths + 1] = user_snippets
      end
      require("luasnip.loaders.from_lua").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = paths,
      }
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    event = "InsertEnter",
    dependencies = {
      "friendly-snippets",
    },
  },
  { "rafamadriz/friendly-snippets", lazy = true, cond = nvoid.builtin.luasnip.sources.friendly_snippets },
  {
    "folke/neodev.nvim",
    lazy = true,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvoid.plugins.config.autopairs").setup()
    end,
    enabled = nvoid.builtin.autopairs.active,
    dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- run = ":TSUpdate",
    config = function()
      dofile(vim.g.base16_cache .. "treesitter")
      local utils = require "nvoid.utils"
      local path = utils.join_paths(get_runtime_dir(), "site", "pack", "lazy", "opt", "nvim-treesitter")
      vim.opt.rtp:prepend(path) -- treesitter needs to be before nvim's runtime in rtp
      require("nvoid.plugins.config.treesitter").setup()
    end,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = "User FileOpened",
  },

  -- NvimTree
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      dofile(vim.g.base16_cache .. "nvimtree")
      require("nvoid.plugins.config.nvimtree").setup()
    end,
    enabled = nvoid.builtin.nvimtree.active,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
  },
  {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
            vim.schedule(function()
              require("lazy").load { plugins = { "gitsigns.nvim" } }
            end)
          end
        end,
      })
    end,
    config = function()
      dofile(vim.g.base16_cache .. "git")
      require("nvoid.plugins.config.gitsigns").setup()
    end,
    -- event = "User FileOpened",
    -- cmd = "Gitsigns",
    enabled = nvoid.builtin.gitsigns.active,
  },

  -- Term
  {
    "numToStr/FTerm.nvim",
    config = function()
      require "nvoid.plugins.config.fterm"
    end,
  },

  -- Whichkey
  {
    "folke/which-key.nvim",
    config = function()
      dofile(vim.g.base16_cache .. "whichkey")
      require("nvoid.plugins.config.which-key").setup()
    end,
    cmd = "WhichKey",
    event = "VeryLazy",
    enabled = nvoid.builtin.which_key.active,
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    config = function()
      require("nvoid.plugins.config.comment").setup()
    end,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
    enabled = nvoid.builtin.comment.active,
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    enabled = nvoid.use_icons,
    config = function ()
      dofile(vim.g.base16_cache .. "devicons")
    end,
    lazy = true,
  },

  -- alpha
  {
    "goolord/alpha-nvim",
    config = function()
      dofile(vim.g.base16_cache .. "alpha")
      require("nvoid.plugins.config.alpha").setup()
    end,
    enabled = nvoid.builtin.alpha.active,
    event = "VimEnter",
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("nvoid.plugins.config.illuminate").setup()
    end,
    event = "User FileOpened",
    enabled = nvoid.builtin.illuminate.active,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      dofile(vim.g.base16_cache .. "blankline")
      require("nvoid.plugins.config.indentlines").setup()
    end,
    init = function()
      require("nvoid.core.lazyload").lazy_load "indent-blankline.nvim"
    end,
    event = "User FileOpened",
    enabled = nvoid.builtin.indentlines.active,
  },
}

local default_snapshot_path = join_paths(get_nvoid_base_dir(), "snapshots", "default.json")
local content = vim.fn.readfile(default_snapshot_path)
local default_sha1 = assert(vim.fn.json_decode(content))

-- taken form <https://github.com/folke/lazy.nvim/blob/c7122d64cdf16766433588486adcee67571de6d0/lua/lazy/core/plugin.lua#L27>
local get_short_name = function(long_name)
  local name = long_name:sub(-4) == ".git" and long_name:sub(1, -5) or long_name
  local slash = name:reverse():find("/", 1, true) --[[@as number?]]
  return slash and name:sub(#name - slash + 2) or long_name:gsub("%W+", "_")
end

local get_default_sha1 = function(spec)
  local short_name = get_short_name(spec[1])
  return default_sha1[short_name] and default_sha1[short_name].commit
end

if not vim.env.NVOID_DEV_MODE then
  --  Manually lock the commit hashes of core plugins
  for _, spec in ipairs(core_plugins) do
    spec["commit"] = get_default_sha1(spec)
  end
end

return core_plugins
