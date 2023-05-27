local M = {}

M.load_default_options = function()
  local utils = require "nvoid.utils"
  local join_paths = utils.join_paths

  local default_options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 1,
    colorcolumn = "99999",
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    foldmethod = "manual",
    foldexpr = "",
    guifont = "monospace:h17",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    mouse = "a",
    pumheight = 10,
    showmode = false,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    termguicolors = true,
    timeoutlen = 250,
    title = true,
    undofile = true,
    updatetime = 300,
    writebackup = false,
    laststatus = 3,
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    cursorline = true,
    number = true,
    relativenumber = false,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    shadafile = join_paths(get_cache_dir(), "nvoid.shada"),
  }

  ---  SETTINGS  ---
  vim.opt.spelllang:append "cjk" -- disable spellchecking for asian characters (VIM algorithm does not support it)
  vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
  vim.opt.shortmess:append "I" -- don't show the default intro message
  vim.opt.whichwrap:append "<,>,[,],h,l"

  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end

  vim.filetype.add {
    extension = {
      tex = "tex",
      zir = "zir",
      cr = "crystal",
    },
    pattern = {
      ["[jt]sconfig.*.json"] = "jsonc",
    },
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = nvoid.icons.diagnostics.Error },
        { name = "DiagnosticSignWarn",  text = nvoid.icons.diagnostics.Warning },
        { name = "DiagnosticSignHint",  text = nvoid.icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo",  text = nvoid.icons.diagnostics.Information },
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)
end

M.load_headless_options = function()
  vim.opt.shortmess = ""   -- try to prevent echom from cutting messages off or prompting
  vim.opt.more = false     -- don't pause listing when screen is filled
  vim.opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
  vim.opt.columns = 9999   -- set the widest screen possible
  vim.opt.swapfile = false -- don't use a swap file
end

M.load_defaults = function()
  if #vim.api.nvim_list_uis() == 0 then
    M.load_headless_options()
    return
  end
  M.load_default_options()
end

return M
