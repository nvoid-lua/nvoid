-- Core Modules
local core_modules = {
  "nvoid.core.key-map",
  "nvoid.core.autocmd",
  "nvoid.core.options"
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

-- G
local g = {
  loaded_matchit = 1,
  matchup_delim_stopline = 1500,
  matchup_matchparen_stopline = 400,
}

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
-- Requiring G
for k, v in pairs(g) do
  vim.g[k] = v
end
