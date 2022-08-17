local M = {}
local lazy = require("nvoid.core.lazy_load")
local config = require("nvoid.core.utils").load_config().plugins.remove
M.def_plugins = {
  -- Plenary
  { "nvim-lua/plenary.nvim" },

  -- Packer
  { "wbthomason/packer.nvim", cmd = lazy.packer_cmds },

  -- UI and colors
  {
    "nvoid-lua/nvoid-ui",
    config = function()
      require("nvoid.plugins.config.ui")
    end,
  },

  -- Icons
  {
    "kyazdani42/nvim-web-devicons",
    after = "nvoid-ui",
    module = "nvim-web-devicons",
    config = function()
      require("nvoid.plugins.config.others").devicons()
    end,
  },

  -- Indent Blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    opt = true,
    disable = config.indent_blankline,
    after = "nvim-treesitter",
    config = function()
      require("nvoid.plugins.config.others").indent()
    end,
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    disable = config.colorizer,
    opt = true,
    config = function()
      require("nvoid.plugins.config.others").colorizer()
    end,
  },

  -- Tree Sitter
  {
    "nvim-treesitter/nvim-treesitter",
    module = "nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvoid.plugins.config.treesitter")
    end,
  },

  -- Git Sign
  {
    "lewis6991/gitsigns.nvim",
    disable = config.gitsigns,
    config = function()
      require("nvoid.plugins.config.gitsigns")
    end,
  },

  -- LSP
  { "williamboman/nvim-lsp-installer" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvoid.plugins.config.lsp")
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim", after = "nvim-lspconfig", disable = config.null_ls, },
  { "rafamadriz/friendly-snippets", module = { "cmp", "cmp_nvim_lsp" } },

  -- CMP
  {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require("nvoid.plugins.config.cmp")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    cpnfig = function()
      require("nvoid.plugins.config.others").luasnip()
    end,
  },

  -- CMP Extensions
  { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
  { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" },
  { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-path", after = "cmp-buffer" },

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("nvoid.plugins.config.autopairs")
    end,
  },

  -- Alpha
  {
    "goolord/alpha-nvim",
    disable = config.alpha,
    after = "nvoid-ui",
    config = function()
      require("nvoid.plugins.config.alpha")
    end,
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    module = "Comment",
    keys = { "gc", "gb" },
    commit = "538dac19fb982278613688627bef7c0d9c442748",
    config = function()
      require("nvoid.plugins.config.others").commet()
    end,
  },

  -- Nvim Tree
  {
    "kyazdani42/nvim-tree.lua",
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly',
    config = function()
      require("nvoid.plugins.config.nvimtree")
    end,
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    disable = config.telescope,
    config = function()
      require("base16").load_highlight("telescope")
      require("nvoid.plugins.config.treesitter")
    end,
  },

  -- Which Key
  {
    "folke/which-key.nvim",
    disable = config.which_key,
    config = function()
      require("nvoid.plugins.config.which-key")
    end,
  },

  -- Notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("nvoid.plugins.config.notify").notify()
    end,
  },

  { "lewis6991/impatient.nvim", module = "impatient" },
}
return M
