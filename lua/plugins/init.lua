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

return require("packer").startup(function(use)
-- { PACKER
    use { "wbthomason/packer.nvim" }
-- }

-- { LSP
   use { "glepnir/lspsaga.nvim" }
   use { "folke/lsp-colors.nvim" }
   use { "onsails/lspkind-nvim" }
   use { "neovim/nvim-lspconfig" }
   use { "L3MON4D3/LuaSnip" }
   use { "williamboman/nvim-lsp-installer" }
-- }

-- { CMP
   use { "hrsh7th/nvim-cmp" }
   use { "hrsh7th/cmp-nvim-lua" }
   use { "hrsh7th/cmp-nvim-lsp" }
   use { "hrsh7th/cmp-buffer" }
   use { "hrsh7th/cmp-path" }
   use { "saadparwaiz1/cmp_luasnip" }
-- }

-- { Whichkey
   use { "folke/which-key.nvim" }
-- }

-- { Tab, Statusline, Indintline
   use { "akinsho/bufferline.nvim" }
   use { "famiu/feline.nvim" }
   use { "lukas-reineke/indent-blankline.nvim" }
   use { "Asheq/close-buffers.vim" }
-- }

-- { comment
   use { "winston0410/commented.nvim" }
-- }

-- { TERM
    use {"akinsho/toggleterm.nvim"}
-- }

-- { Files
   use { "kyazdani42/nvim-tree.lua" }
   use { "kevinhwang91/rnvimr" }
-- }

-- { Telescope
   use { "nvim-lua/plenary.nvim" }
   use { "nvim-telescope/telescope.nvim" }
-- }

-- { Icons
   use { "kyazdani42/nvim-web-devicons" }
   use { "ryanoasis/vim-devicons" }
-- }

-- { Dashboard
   use { "glepnir/dashboard-nvim" }
-- }

-- { Git
   use { "lewis6991/gitsigns.nvim" }
-- }

-- { AUTOPAIRS
   use { "windwp/nvim-autopairs" }
   use { "andymass/vim-matchup" }
-- }

-- { Colors and treesitter
   use { "norcalli/nvim-colorizer.lua" }
   use { "nvim-treesitter/nvim-treesitter" }
   use { "Lunarvim/Onedarker" }
   use { "arcticicestudio/nord-vim" }
   use { "folke/tokyonight.nvim" }
   use { "NTBBloodbath/doom-one.nvim" }
   use { "dracula/vim" }
   use { "morhetz/gruvbox" }
-- }
end)

