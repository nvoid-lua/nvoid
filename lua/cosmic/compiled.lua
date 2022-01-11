-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ysf/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/ysf/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/ysf/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/ysf/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ysf/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  Onedarker = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/Onedarker",
    url = "https://github.com/Lunarvim/Onedarker"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31nvoid.plugins.config.alpha\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\1\2I\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vbetter\31nvoid.plugins.config.other\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvoid.plugins.config.bufferline\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["close-buffers.vim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/close-buffers.vim",
    url = "https://github.com/Asheq/close-buffers.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["commented.nvim"] = {
    config = { "\27LJ\1\2L\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14commented\31nvoid.plugins.config.other\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/commented.nvim",
    url = "https://github.com/winston0410/commented.nvim"
  },
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/LunarVim/darkplus.nvim"
  },
  ["doom-one.nvim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2F\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\bgit\31nvoid.plugins.config.other\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvoid.plugins.config.indentline\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nvoid.plugins.config.lualine\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2L\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14autopairs\31nvoid.plugins.config.other\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29nvoid.plugins.config.cmp\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2L\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14colorizer\31nvoid.plugins.config.other\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29nvoid.plugins.config.lsp\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\1\2I\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vnotify\31nvoid.plugins.config.other\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { '\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"nvoid.plugins.config.nvimtree\frequire\0' },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvoid.plugins.config.treesitter\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&nvoid.plugins.config.icons-config\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2>\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0#nvoid.plugins.config.telescope\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30nvoid.plugins.config.term\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nvoid.plugins.config.trouble\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  vim = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/vim",
    url = "https://github.com/dracula/vim"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2>\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0#nvoid.plugins.config.which-key\frequire\0" },
    loaded = true,
    path = "/home/ysf/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29nvoid.plugins.config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\29nvoid.plugins.config.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0#nvoid.plugins.config.which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvoid.plugins.config.indentline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\31nvoid.plugins.config.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nvoid.plugins.config.trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0!nvoid.plugins.config.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2L\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14autopairs\31nvoid.plugins.config.other\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0#nvoid.plugins.config.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring('\27LJ\1\2=\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0"nvoid.plugins.config.nvimtree\frequire\0', "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: commented.nvim
time([[Config for commented.nvim]], true)
try_loadstring("\27LJ\1\2L\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14commented\31nvoid.plugins.config.other\frequire\0", "config", "commented.nvim")
time([[Config for commented.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\30nvoid.plugins.config.term\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\1\2A\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0&nvoid.plugins.config.icons-config\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2F\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\bgit\31nvoid.plugins.config.other\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2L\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14colorizer\31nvoid.plugins.config.other\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvoid.plugins.config.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\1\2I\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vnotify\31nvoid.plugins.config.other\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: better-escape.nvim
time([[Config for better-escape.nvim]], true)
try_loadstring("\27LJ\1\2I\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vbetter\31nvoid.plugins.config.other\frequire\0", "config", "better-escape.nvim")
time([[Config for better-escape.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0$nvoid.plugins.config.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
