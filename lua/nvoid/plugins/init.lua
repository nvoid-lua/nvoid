-- Commit
local commit = {
  cmp_path = "d83839ae510d18530c6d36b662a9e806d4dceb73",
}
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]]
-- Use a protected call so we don't error out on first use
local present, packer = pcall(require, "nvoid.plugins.packerInit")
if not present then
   return false
end
-- Use
local use = packer.use
-- Plugin List
return packer.startup(function()
-- Plenary
   use { "nvim-lua/plenary.nvim" }
-- Packer
   use { "wbthomason/packer.nvim", event = "VimEnter" }
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
-- Icons
   use { "kyazdani42/nvim-web-devicons" }
-- Feline
   use { "nvim-lualine/lualine.nvim" }
   -- use { "famiu/feline.nvim" }
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
-- Matchup
   use { "andymass/vim-matchup" }
-- LSP Install
   use { "williamboman/nvim-lsp-installer" }
-- CMP
   use { "hrsh7th/nvim-cmp" }
-- LuaSnip
   use { "L3MON4D3/LuaSnip" }
-- CMP LuaSnip
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
-- Term
   use { "akinsho/toggleterm.nvim" }
-- Which Key
   use { "folke/which-key.nvim" }
-- Trouble
   use { "folke/trouble.nvim" }
-- load user defined plugins
   require("nvoid.core.hooks").run("install_plugins", use)
------------------------------------------------------------------
-- Add the config
local config = {
 "nvoid.plugins.config.icons-config",
 -- "nvoid.plugins.config.statusline",
 "nvoid.plugins.config.lualine",
 "nvoid.plugins.config.bufferline",
 "nvoid.plugins.config.indentline",
 "nvoid.plugins.config.colorizer",
 "nvoid.plugins.config.git",
 "nvoid.plugins.config.treesitter",
 "nvoid.plugins.config.lsp",
 "nvoid.plugins.config.cmp",
 "nvoid.plugins.config.autopairs",
 "nvoid.plugins.config.dashboard",
 "nvoid.plugins.config.nvimtree",
 "nvoid.plugins.config.telescope",
 "nvoid.plugins.config.term",
 "nvoid.plugins.config.which-key",
 "nvoid.plugins.config.trouble",
 "nvoid.plugins.config.comment"
}
for _, module in ipairs(config) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end
end)
