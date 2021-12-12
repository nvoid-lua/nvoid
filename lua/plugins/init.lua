local present, packer = pcall(require, "plugins.packerInit")
if not present then
   return false
end
local use = packer.use

return packer.startup(function()
-- Packer
    use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }
-- Icons
   use {
       "kyazdani42/nvim-web-devicons",
      config = require("plugins/config/icons-config")
   }
-- Feline
   use {
       "famiu/feline.nvim",
       config = require("plugins/config/statusline")
   }
-- Bufferline
   use {
       "akinsho/bufferline.nvim",
       config = require("plugins/config/bufferline")
   }
   use { "Asheq/close-buffers.vim" }
-- Indent Line
   use {
       "lukas-reineke/indent-blankline.nvim",
       config = require("plugins/config/indentline")
   }
-- Colorizer
   use {
       "norcalli/nvim-colorizer.lua",
       config = require("plugins/config/colorizer")
   }
-- Tree Sitter
   use {
       "nvim-treesitter/nvim-treesitter",
       config = require("plugins/config/treesitter")
   }
-- Git Sign
   use {
       "lewis6991/gitsigns.nvim",
       config = require("plugins/config/git")
   }
-- LSP
   use {
       "neovim/nvim-lspconfig",
       config = require("plugins/config/lsp")
   }

   use { "glepnir/lspsaga.nvim" }
   use { "folke/lsp-colors.nvim" }
   use { "onsails/lspkind-nvim" }
   use { "williamboman/nvim-lsp-installer" }
-- CMP
   use {
       "hrsh7th/nvim-cmp",
       config = require("plugins/config/cmp")
   }
   use { "L3MON4D3/LuaSnip" }
   use { "saadparwaiz1/cmp_luasnip" }
   use { "hrsh7th/cmp-nvim-lua" }
   use { "hrsh7th/cmp-nvim-lsp" }
   use { "hrsh7th/cmp-buffer" }
   use { "hrsh7th/cmp-path" }
-- Auto Pairs
   use {
       "windwp/nvim-autopairs",
       config = require("plugins/config/autopairs")
   }
-- Dashboard
   use {
       "glepnir/dashboard-nvim",
       config = require("plugins/config/dashboard")
   }
-- Comment
   use { "winston0410/commented.nvim" }
-- Nvim Tree
   use {
       "kyazdani42/nvim-tree.lua",
       config = require("plugins/config/nvimtree")
   }
-- Telescope
   use {
       "nvim-telescope/telescope.nvim",
       config = require("plugins/config/telescope")
   }
-- Colorschemes
   use { "Lunarvim/Onedarker" }
   use { "arcticicestudio/nord-vim" }
   use { "folke/tokyonight.nvim" }
   use { "NTBBloodbath/doom-one.nvim" }
   use { "dracula/vim" }
   use { "morhetz/gruvbox" }
-- Other
   use {
       "akinsho/toggleterm.nvim",
       config = require("plugins/config/term")
   }
   use { "nvim-lua/plenary.nvim" }
   use { "ryanoasis/vim-devicons" }

   use { "andymass/vim-matchup" }
   use {
       "folke/which-key.nvim",
       config = require("plugins/config/which-key")
   }
end)
