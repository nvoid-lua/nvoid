local M = {}
local Log = require "nvoid.core.log"

--- Load the default set of autogroups and autocommands.
function M.load_defaults()
  local user_config_file = require("nvoid.config"):get_user_config_path()

  if vim.loop.os_uname().version:match "Windows" then
    -- autocmds require forward slashes even on windows
    user_config_file = user_config_file:gsub("\\", "/")
  end

  local definitions = {
    {
      "TextYankPost",
      {
        group = "_general_settings",
        pattern = "*",
        desc = "Highlight text on yank",
        callback = function()
          require("vim.highlight").on_yank { higroup = "Search", timeout = 200 }
        end,
      },
    },
    {
      "BufWritePost",
      {
        group = "_general_settings",
        pattern = user_config_file,
        desc = "Trigger NvoidReload on saving " .. vim.fn.expand "%:~",
        callback = function()
          require("nvoid.config"):reload()
        end,
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = "qf",
        command = "set nobuflisted",
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = { "gitcommit", "markdown" },
        command = "setlocal wrap spell",
      },
    },
    {
      "FileType",
      {
        group = "_buffer_mappings",
        pattern = { "qf", "help", "man", "floaterm", "lspinfo", "lsp-installer", "null-ls-info" },
        command = "nnoremap <silent> <buffer> q :close<CR>",
      },
    },
    {
      { "BufWinEnter", "BufRead", "BufNewFile" },
      {
        group = "_format_options",
        pattern = "*",
        command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
      },
    },
    {
      "VimResized",
      {
        group = "_auto_resize",
        pattern = "*",
        command = "tabdo wincmd =",
      },
    },
  }

  M.define_autocmds(definitions)
end

local get_format_on_save_opts = function()
  local defaults = require("nvoid.config.defaults").format_on_save
  -- accept a basic boolean `nvoid.lsp.format_on_save=true`
  if type(nvoid.lsp.format_on_save) ~= "table" then
    return defaults
  end

  return {
    pattern = nvoid.lsp.format_on_save.pattern or defaults.pattern,
    timeout = nvoid.lsp.format_on_save.timeout or defaults.timeout,
  }
end

function M.enable_format_on_save()
  local opts = get_format_on_save_opts()
  vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      require("nvoid.lsp.utils").format { timeout_ms = opts.timeout, filter = opts.filter }
    end,
  })
  Log:debug "enabled format-on-save"
end

function M.disable_format_on_save()
  M.clear_augroup "lsp_format_on_save"
  Log:debug "disabled format-on-save"
end

function M.configure_format_on_save()
  if nvoid.lsp.format_on_save then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.toggle_format_on_save()
  local exists, autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = "lsp_format_on_save",
    event = "BufWritePre",
  })
  if not exists or #autocmds == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end
--- Clean autocommand in a group if it exists
--- This is safer than trying to delete the augroup itself
---@param name string the augroup name
function M.clear_augroup(name)
  -- defer the function in case the autocommand is still in-use
  Log:debug("request to clear autocmds  " .. name)
  vim.schedule(function()
    pcall(function()
      vim.api.nvim_clear_autocmds { group = name }
    end)
  end)
end

--- Create autocommand groups based on the passed definitions
--- Also creates the augroup automatically if it doesn't exist
---@param definitions table contains a tuple of event, opts, see `:h nvim_create_autocmd`
function M.define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

return M
