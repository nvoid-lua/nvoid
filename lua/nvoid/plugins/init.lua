local commit = {
  cmp_path = "d83839ae510d18530c6d36b662a9e806d4dceb73",
  -- nvim_lsp_installer = "d7b10b13d72d4bf8f7b34779ddc3514bcc26b0f2"
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
-- Automatically Reload Packer
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerInstall
  augroup end
]]

-- Use a protected call so we don't error out on first use
-- local status_ok, packerls = pcall(require, "packer")
-- if not status_ok then
  -- return
-- end

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
-- Git Sign
   use { "lewis6991/gitsigns.nvim" }
-- Tree Sitter
   use { "nvim-treesitter/nvim-treesitter" }
-- LSP
   use { "neovim/nvim-lspconfig" }
-- LSP Install
   use { "williamboman/nvim-lsp-installer" }
-- LSP kind
   use { "onsails/lspkind-nvim" }
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
-- Comment
   use { "winston0410/commented.nvim" }
-- Matchup
   use { "andymass/vim-matchup" }
-- Plenary
   use { "nvim-lua/plenary.nvim" }
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

local modules = {
 "nvoid.plugins.config.icons-config",
 "nvoid.plugins.config.statusline",
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

for _, module in ipairs(modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

end)
