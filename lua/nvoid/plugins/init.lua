local present, nvoid_packer = pcall(require, "nvoid.plugins.packerInit")

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

if not present then
  return false
end

local packer = nvoid_packer.packer
local use = packer.use

local ok, user_plugins = pcall(require, "custom.nvoidrc")
if not ok then
  user_plugins = { add = {} }
end

if not vim.tbl_islist(user_plugins.plugins_add) then
  user_plugins.plugins_add = {}
end

return packer.startup(function()
  -- Packer
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

  -- Plenary, Popup and Nui
  use { "nvim-lua/plenary.nvim" }
  use { "nvim-lua/popup.nvim" }
  use { "MunifTanjim/nui.nvim" }

  -- colorschemes
  use {
    "nvoid-lua/base16",
    config = function()
      require("nvoid.colors").init()
    end,
  }

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require "nvoid.plugins.config.icons-config"
    end,
  }

  -- LuaLine
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "nvoid.plugins.config.lualine"
    end,
  }

  -- Bufferline
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require "nvoid.plugins.config.bufferline"
    end,
    branch = "main",
    event = "BufWinEnter",
  }

  -- Buffer Close
  use { "Asheq/close-buffers.vim" }

  -- Indent Line
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "nvoid.plugins.config.indentline"
    end,
  }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("nvoid.plugins.config.other").colorizer()
    end,
  }

  -- Git Sign
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("nvoid.plugins.config.other").git()
    end,
    event = "BufRead",
  }

  -- Tree Sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "nvoid.plugins.config.treesitter"
    end,
  }

  -- LSP Install
  use { "williamboman/nvim-lsp-installer" }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvoid.plugins.config.lsp"
    end,
  }
  use { "jose-elias-alvarez/null-ls.nvim" }

  -- Better Escape
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("nvoid.plugins.config.other").better()
    end,
  }

  -- CMP
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "nvoid.plugins.config.cmp"
    end,
  }

  -- Snippets
  use { "rafamadriz/friendly-snippets" }
  use { "L3MON4D3/LuaSnip" }

  -- CMP Extensions
  use { "saadparwaiz1/cmp_luasnip" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }

  -- Auto Pairs
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvoid.plugins.config.other").autopairs()
    end,
  }

  -- Comment
  use {
    "winston0410/commented.nvim",
    config = function()
      require("nvoid.plugins.config.other").commented()
    end,
    event = "BufWinEnter",
  }

  -- Nvim Tree
  use {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "nvoid.plugins.config.nvimtree"
    end,
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "nvoid.plugins.config.telescope"
    end,
  }

  -- Telescope Extensions
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    event = "BufWinEnter",
  }
  use { "nvim-telescope/telescope-media-files.nvim" }

  -- Alpha
  use {
    "goolord/alpha-nvim",
    config = function()
      require "nvoid.plugins.config.alpha"
    end,
  }
  -- Term
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require "nvoid.plugins.config.term"
    end,
    event = "BufWinEnter",
  }

  -- Which Key
  use {
    "folke/which-key.nvim",
    config = function()
      require "nvoid.plugins.config.which-key"
    end,
    event = "BufWinEnter",
  }

  -- Trouble
  use {
    "folke/trouble.nvim",
    config = function()
      require "nvoid.plugins.config.trouble"
    end,
  }

  use {
    "andymass/vim-matchup",
    event = "BufWinEnter",
  }

  -- Notify
  use {
    "rcarriga/nvim-notify",
    config = function()
      require("nvoid.plugins.config.other").notify()
    end,
  }

  if user_plugins.plugins_add and not vim.tbl_isempty(user_plugins.plugins_add) then
    for _, plugin in pairs(user_plugins.plugins_add) do
      use(plugin)
    end
  end

  if nvoid_packer.first_install then
    packer.sync()
  end
end)
