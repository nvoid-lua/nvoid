local opt = vim.opt
local config = require('nvoid.core.def-config')
-- Wrap
if config.options.wrap == 'true' then
    vim.opt.wrap = true
elseif config.options.wrap == 'false' then
    opt.wrap = false
end
-- Show Mode
if config.options.show_mode == 'true' then
    vim.opt.showmode = true
elseif config.options.show_mode == 'false' then
    vim.opt.showmode = false
end
-- Backup
if config.options.backup == 'true' then
    vim.opt.backup = true
elseif config.options.backup == 'false' then
    vim.opt.backup = false
end

-- Swap File
if config.options.swap_file == 'true' then
    vim.opt.swapfile = true
elseif config.options.swap_file == 'false' then
    vim.opt.swapfile = false
end
-- termguicolors
if config.options.term_gui_colors == 'true' then
    vim.opt.termguicolors = true
elseif config.options.term_gui_colors == 'false' then
    vim.opt.termguicolors = false
end
-- Smart Indent
if config.options.smart_indent == 'true' then
    vim.opt.smartindent = true
elseif config.options.smart_indent == 'false' then
    vim.opt.smartindent = false
end
-- Smart Case
if config.options.smart_case == 'true' then
    vim.opt.smartcase = true
elseif config.options.smart_case == 'false' then
    vim.opt.smartcase = false
end
-- Ignore Case
if config.options.ignore_case == 'true' then
    vim.opt.ignorecase = true
elseif config.options.ignore_case == 'false' then
    vim.opt.ignorecase = false
end
-- Expand Tab
if config.options.expand_tab == 'true' then
    vim.opt.expandtab = true
elseif config.options.expand_tab == 'false' then
    vim.opt.expandtab = false
end
-- Hidden
if config.options.hidden == 'true' then
    vim.opt.hidden = true
elseif config.options.hidden == 'true' then
    vim.opt.hidden = false
end
-- Lazy Redraw
if config.options.lazy_redraw == 'true' then
    vim.opt.lazyredraw = true
elseif config.options.lazy_redraw == 'false' then
    vim.opt.lazyredraw = false
end
-- showmatch
if config.options.show_match == 'true' then
    vim.opt.showmatch = true
elseif config.options.show_match == 'false' then
    vim.opt.showmatch = false
end
-- Split Below
if config.options.split_below == 'true' then
       vim.opt.splitbelow = true
elseif config.options.split_below == 'false' then
     vim.opt.split_below= false
end
-- Split Right
if config.options.split_right == 'true' then
       vim.opt.splitright = true
elseif config.options.split_right == 'false' then
     vim.opt.splitright = false
end
-- Cursor Line
if config.options.cursor_line == 'true' then
       vim.opt.cursorline = true
elseif config.options.cursor_line == 'false' then
     vim.opt.cursorline = false
end
-- Number
if config.options.number == 'true' then
         vim.opt.number = true
elseif config.options.number == 'false' then
         vim.opt.number = false
end
-- Relative Number
if config.options.relative_number == 'true' then
         vim.opt.relativenumber = true
elseif config.options.number == 'false' then
         vim.opt.relativenumber = false
end

opt.numberwidth = config.options.number_width
opt.cmdheight = config.options.cmdheight
opt.mouse = config.options.mouse
opt.clipboard = config.options.clipboard
vim.g.mapleader = config.options.mapleader
