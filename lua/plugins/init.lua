local present, packer = pcall(require, "plugins.packerInit")
if not present then
   return false
end
local use = packer.use

return packer.startup(function()
-- Packer
    use { "wbthomason/packer.nvim" }
-- Icons
   use { "kyazdani42/nvim-web-devicons" }
-- Feline
   use { "famiu/feline.nvim" }
-- Bufferline
   use { "akinsho/bufferline.nvim" }
   use { "Asheq/close-buffers.vim" }
-- Indent Line
   use { "lukas-reineke/indent-blankline.nvim" }
-- Colorizer
   use { "norcalli/nvim-colorizer.lua" }
-- Tree Sitter
   use {
       "nvim-treesitter/nvim-treesitter" }
-- Git Sign
   use { "lewis6991/gitsigns.nvim" }
-- LSP
   use { "neovim/nvim-lspconfig" }
   use { "williamboman/nvim-lsp-installer" }
   use { "glepnir/lspsaga.nvim" }
-- CMP
   use { "hrsh7th/nvim-cmp" }
   use { "L3MON4D3/LuaSnip" }
   use { "saadparwaiz1/cmp_luasnip" }
   use { "hrsh7th/cmp-nvim-lua" }
   use { "hrsh7th/cmp-nvim-lsp" }
   use { "hrsh7th/cmp-buffer" }
   use { "hrsh7th/cmp-path" }
-- Auto Pairs
   use { "windwp/nvim-autopairs" }
-- Dashboard
   use { "glepnir/dashboard-nvim" }
-- Comment
   use { "winston0410/commented.nvim" }
-- Nvim Tree
   use { "kyazdani42/nvim-tree.lua" }
-- Telescope
   use { "nvim-telescope/telescope.nvim" }
-- Onedarker
   use { "Lunarvim/Onedarker" }
-- Nord
   use { "arcticicestudio/nord-vim" }
-- Tokyonight
   use { "folke/tokyonight.nvim" }
-- Doom One
   use { "NTBBloodbath/doom-one.nvim" }
-- Dracual
   use { "dracula/vim" }
-- Gruvbox
   use { "morhetz/gruvbox" }
-- Term
   use { "akinsho/toggleterm.nvim" }
-- Plenary
   use { "nvim-lua/plenary.nvim" }
-- Icons   
   use { "ryanoasis/vim-devicons" }
-- Matchup
   use { "andymass/vim-matchup" }
-- Which Key
   use { "folke/which-key.nvim" }
end)
