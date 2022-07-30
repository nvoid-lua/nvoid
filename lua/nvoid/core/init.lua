-- Core Modules
local core_modules = {
  "nvoid.core.autocmd",
  "nvoid.core.options",
  "nvoid.core.cmd",
  "nvoid.ui.transparency"
}

-- Options
local options = {
  history = 100,
  shiftwidth = 2,
  synmaxcol = 240,
  tabstop = 4,
  pumheight = 10,
  timeoutlen = 150,
  completeopt = "menuone,noselect",
  updatetime = 300,
  termguicolors = true,
  splitbelow = true,
  splitright = true,
}

-- Vim ls
vim.cmd [[
  set whichwrap+=<,>,[,],h,l
  set iskeyword+=-
  set formatoptions-=cro
  let g:matchup_matchparen_offscreen = {'method': 'popup'}"
  set shortmess+=c"
  let g:loaded_matchit = 1"
]]

-- Requiring Core Modules
for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end
-- Requiring Options
for k, v in pairs(options) do
  vim.opt[k] = v
end
