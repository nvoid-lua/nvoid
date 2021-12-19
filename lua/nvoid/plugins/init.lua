local commit = {
  cmp_path = "d83839ae510d18530c6d36b662a9e806d4dceb73",
  nvim_lsp_installer = "d7b10b13d72d4bf8f7b34779ddc3514bcc26b0f2",
}

local present, packer = pcall(require, "nvoid.plugins.packerInit")
if not present then
   return false
end
local use = packer.use


local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerClean
  augroup end
]]
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerInstall
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function()
-- Packer
   use { "wbthomason/packer.nvim" }
-- Icons
   use { "kyazdani42/nvim-web-devicons" }
-- Feline
   use { "famiu/feline.nvim" }
-- Bufferline
   use { "akinsho/bufferline.nvim" }
-- Buffer Close
   use { "Asheq/close-buffers.vim" }
-- Indent Line
   use { "lukas-reineke/indent-blankline.nvim" }
-- Colorizer
   use { "norcalli/nvim-colorizer.lua" }
-- Tree Sitter
   use { "nvim-treesitter/nvim-treesitter" }
-- Git Sign
   use { "lewis6991/gitsigns.nvim" }
-- LSP
   use { "neovim/nvim-lspconfig" }
-- LSP Install
   use { "williamboman/nvim-lsp-installer", commit = commit.nvim_lsp_installer }
-- LSP kind
   use { "onsails/lspkind-nvim" }
-- Trouble
   use { "folke/trouble.nvim" }
-- CMP
   use { "hrsh7th/nvim-cmp" }
-- Lua Snip
   use { "L3MON4D3/LuaSnip" }
-- CMP luasnip
   use { "saadparwaiz1/cmp_luasnip" }
-- CMP Lua
   use { "hrsh7th/cmp-nvim-lua" }
-- CMP LSP
   use { "hrsh7th/cmp-nvim-lsp" }
-- CMP Biffer
   use { "hrsh7th/cmp-buffer" }
-- CMP Path
   use { "hrsh7th/cmp-path", commit = commit.cmp_path, }
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
-- Dark Plus
   use { "LunarVim/darkplus.nvim" }
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
