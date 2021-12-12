local present, packer = pcall(require, "plugins.packerInit")
require("plugins/plugConfig")
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
   }
-- Feline
   use {
       "famiu/feline.nvim",
   }
-- Bufferline
   use {
       "akinsho/bufferline.nvim",
   }
   use { "Asheq/close-buffers.vim" }
-- Indent Line
   use {
       "lukas-reineke/indent-blankline.nvim",
   }
-- Colorizer
   use {
       "norcalli/nvim-colorizer.lua",
   }
-- Tree Sitter
   use {
       "nvim-treesitter/nvim-treesitter",
   }
-- Git Sign
   use {
       "lewis6991/gitsigns.nvim",
   }
-- LSP
   use {
       "neovim/nvim-lspconfig",
   }

   use { "glepnir/lspsaga.nvim" }
   use { "folke/lsp-colors.nvim" }
   use { "onsails/lspkind-nvim" }
   use { "williamboman/nvim-lsp-installer" }
-- CMP
   use {
       "hrsh7th/nvim-cmp",
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
   }
-- Dashboard
   use {
       "glepnir/dashboard-nvim",
   }
-- Comment
   use { "winston0410/commented.nvim" }
-- Nvim Tree
   use {
       "kyazdani42/nvim-tree.lua",
   }
-- Telescope
   use {
       "nvim-telescope/telescope.nvim",
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
   }
   use { "nvim-lua/plenary.nvim" }
   use { "ryanoasis/vim-devicons" }

   use { "andymass/vim-matchup" }
   use {
       "folke/which-key.nvim",
   }
end)
