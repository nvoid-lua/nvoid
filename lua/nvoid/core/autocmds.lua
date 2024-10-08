local M = {}
local Log = require "nvoid.core.log"

--- Load the default set of autogroups and autocommands.
function M.load_defaults()
  local definitions = {
    {
      "TextYankPost",
      {
        group = "_general_settings",
        pattern = "*",
        desc = "Highlight text on yank",
        callback = function()
          vim.highlight.on_yank { higroup = "Search", timeout = 100 }
        end,
      },
    },
    {
      "FileType",
      {
        group = "_hide_dap_repl",
        pattern = "dap-repl",
        command = "set nobuflisted",
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = { "lua" },
        desc = "fix gf functionality inside .lua files",
        callback = function()
          ---@diagnostic disable: assign-type-mismatch
          -- credit: https://github.com/sam4llis/nvim-lua-gf
          vim.opt_local.include = [[\v<((do|load)file|require|reload)[^''"]*[''"]\zs[^''"]+]]
          vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
          vim.opt_local.suffixesadd:prepend ".lua"
          vim.opt_local.suffixesadd:prepend "init.lua"

          for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
            vim.opt_local.path:append(path .. "/lua")
          end
        end,
      },
    },
    {
      "FileType",
      {
        group = "_buffer_mappings",
        pattern = {
          "qf",
          "help",
          "man",
          "floaterm",
          "lspinfo",
          "lir",
          "lsp-installer",
          "null-ls-info",
          "tsplayground",
          "DressingSelect",
          "Jaq",
        },
        callback = function()
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
          vim.opt_local.buflisted = false
        end,
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
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = "alpha",
        callback = function()
          vim.cmd [[
            set nobuflisted
          ]]
        end,
      },
    },
    {
      "FileType",
      {
        group = "_dashboard_settings",
        pattern = "alpha",
        command = "set laststatus=0 | autocmd BufUnload <buffer> set laststatus=" .. vim.opt.laststatus._value,
      },
    },
    { -- taken from AstroNvim
      "BufEnter",
      {
        group = "_dir_opened",
        nested = true,
        callback = function(args)
          local bufname = vim.api.nvim_buf_get_name(args.buf)
          if require("nvoid.utils").is_directory(bufname) then
            vim.api.nvim_del_augroup_by_name "_dir_opened"
            -- vim.cmd "do User DirOpened"
            vim.api.nvim_exec_autocmds("User", { pattern = "DirOpened" })
            vim.api.nvim_exec_autocmds(args.event, { buffer = args.buf, data = args.data })
          end
        end,
      },
    },
    { -- taken from AstroNvim
      { "BufRead", "BufWinEnter", "BufNewFile" },
      {
        group = "_file_opened",
        nested = true,
        callback = function(args)
          local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
          if not (vim.fn.expand "%" == "" or buftype == "nofile") then
            vim.api.nvim_del_augroup_by_name "_file_opened"
            -- vim.cmd "do User FileOpened"
            vim.api.nvim_exec_autocmds("User", { pattern = "FileOpened" })
            require("nvoid.lsp").setup()
          end
        end,
      },
    },
  }

  M.define_autocmds(definitions)
end

local get_format_on_save_opts = function()
  local defaults = require("nvoid.config.defaults").format_on_save
  -- accept a basic boolean `nvoid.format_on_save=true`
  if type(nvoid.format_on_save) ~= "table" then
    return defaults
  end

  return {
    pattern = nvoid.format_on_save.pattern or defaults.pattern,
    timeout = nvoid.format_on_save.timeout or defaults.timeout,
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
  if type(nvoid.format_on_save) == "table" and nvoid.format_on_save.enabled then
    M.enable_format_on_save()
  elseif nvoid.format_on_save == true then
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

function M.enable_reload_config_on_save()
  -- autocmds require forward slashes (even on windows)
  local pattern = get_config_dir():gsub("\\", "/") .. "/*.lua"

  vim.api.nvim_create_augroup("nvoid_reload_config_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = "nvoid_reload_config_on_save",
    pattern = pattern,
    desc = "Trigger NvoidReload on saving config.lua",
    callback = function()
      require("nvoid.config"):reload()
      -- require("base16").compile()

      require("plenary.reload").reload_module "base16"
      require("plenary.reload").reload_module "nvoid"
      require("plenary.reload").reload_module "config"
      require("plenary.reload").reload_module(get_config_dir())
      vim.g.theme = nvoid.ui.colorscheme
      vim.g.transparency = nvoid.ui.transparency
      require("base16").load_all_highlights()
    end,
  })
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
