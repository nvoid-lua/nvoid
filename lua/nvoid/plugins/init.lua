local M = {}
M.def_plugins = {
  -- Packer
  { "wbthomason/packer.nvim", event = "VimEnter" },

  -- Plenary
  { "nvim-lua/plenary.nvim" },

  -- colorschemes
  {
    "nvoid-lua/base16",
    config = function()
      require("base16").init()
    end,
  },

  -- Icons
  { "kyazdani42/nvim-web-devicons" },

  -- LSP Install
  { "williamboman/nvim-lsp-installer" },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvoid.plugins.config.lsp"
    end,
  },

  -- Null-ls
  { "jose-elias-alvarez/null-ls.nvim" },

  -- CMP
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "nvoid.plugins.config.cmp"
    end,
  },

  -- Snippets
  { "rafamadriz/friendly-snippets" },
  { "L3MON4D3/LuaSnip" },

  -- CMP Extensions
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    config = function()
      require "nvoid.plugins.config.bufferline"
    end,
    branch = "main",
    event = "BufWinEnter",
  },

  -- Indent Line
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "nvoid.plugins.config.indentline"
    end,
    event = "BufWinEnter",
  },

  -- Git Sign
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "nvoid.plugins.config.gitsigns"
    end,
    event = "BufRead",
  },

  -- Tree Sitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "nvoid.plugins.config.treesitter"
    end,
    event = "BufRead",
    run = ":TSUpdate",
  },

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require "nvoid.plugins.config.autopairs"
    end,
    event = "BufWinEnter",
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require "nvoid.plugins.config.commented"
    end,
    event = "BufWinEnter",
  },

  -- Nvim Tree
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "nvoid.plugins.config.nvimtree"
    end,
    event = "BufWinEnter",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "nvoid.plugins.config.telescope"
    end,
  },

  -- Alpha
  {
    "goolord/alpha-nvim",
    config = function()
      require "nvoid.plugins.config.alpha"
    end,
    event = "BufWinEnter",
  },

  -- Term
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "nvoid.plugins.config.term"
    end,
    event = "BufWinEnter",
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("nvoid.plugins.config.colorizer").colorizer()
    end,
    event = "BufWinEnter",
  },

  -- Which Key
  {
    "folke/which-key.nvim",
    config = function()
      require "nvoid.plugins.config.which-key"
    end,
    event = "BufWinEnter",
  },

  -- Notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("nvoid.plugins.config.notify").notify()
    end,
  },
}
return M
