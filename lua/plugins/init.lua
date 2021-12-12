local present, packer = pcall(require, "plugins.packerInit")
local execute = vim.api.nvim_command
local fn = vim.fn
local use = packer.use
if not present then
   return false
end
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " ..
                install_path)
    execute "packadd packer.nvim"
end
vim.opt.termguicolors = true
return packer.startup(function()
-- { PACKER
    use { "wbthomason/packer.nvim" }
-- }

-- { LSP
   use { "glepnir/lspsaga.nvim" }
   use { "folke/lsp-colors.nvim" }
   use { "onsails/lspkind-nvim" }
   use { "L3MON4D3/LuaSnip" }
   use { "williamboman/nvim-lsp-installer" }
   use {
       "neovim/nvim-lspconfig",
       config = require("plugins/config/lsp")
   }
-- }

-- { CMP
   use {
       "hrsh7th/nvim-cmp",
       config = require("plugins/config/cmp")
   }
   use { "hrsh7th/cmp-nvim-lua" }
   use { "hrsh7th/cmp-nvim-lsp" }
   use { "hrsh7th/cmp-buffer" }
   use { "hrsh7th/cmp-path" }
   use { "saadparwaiz1/cmp_luasnip" }
-- }

-- { Whichkey
   use {
       "folke/which-key.nvim",
       config = require("plugins/config/which-key")
   }
-- }

-- { Tab, Statusline, Indintline
   use {
       "akinsho/bufferline.nvim",
       config = require("plugins/config/bufferline")
   }
   use {
       "famiu/feline.nvim",
       config = require("plugins/config/statusline")
   }
   use {
       "lukas-reineke/indent-blankline.nvim",
       config = require("plugins/config/indentline")
   }
   use { "Asheq/close-buffers.vim" }
-- }

-- { comment
   use { "winston0410/commented.nvim" }
-- }

-- { TERM
   use {
       "akinsho/toggleterm.nvim",
       config = require("plugins/config/term")
   }
-- }

-- { Files
   use {
       "kyazdani42/nvim-tree.lua",
       config = require("plugins/config/nvimtree")
   }
-- }

-- { Telescope
   use { "nvim-lua/plenary.nvim" }
   use {
       "nvim-telescope/telescope.nvim",
       config = require("plugins/config/telescope")
   }
-- }

-- { Icons
   use {
       "kyazdani42/nvim-web-devicons",
      config = require("plugins/config/icons-config")
   }
   use { "ryanoasis/vim-devicons" }
-- }

-- { Dashboard
   use {
       "glepnir/dashboard-nvim",
       config = require("plugins/config/dashboard")
   }
-- }

-- { Git
   use {
       "lewis6991/gitsigns.nvim",
       config = require("plugins/config/git")
   }
-- }

-- { AUTOPAIRS
   use {
       "windwp/nvim-autopairs",
       config = require("plugins/config/autopairs")
   }
   use { "andymass/vim-matchup" }
-- }

-- { Colors and treesitter
   use {
       "norcalli/nvim-colorizer.lua",
       confg = require("plugins/config/colorizer")
   }
   use {
       "nvim-treesitter/nvim-treesitter",
       config = require("plugins/config/treesitter")
   }
   use { "Lunarvim/Onedarker" }
   use { "arcticicestudio/nord-vim" }
   use { "folke/tokyonight.nvim" }
   use { "NTBBloodbath/doom-one.nvim" }
   use { "dracula/vim" }
   use { "morhetz/gruvbox" }
-- }
end)

