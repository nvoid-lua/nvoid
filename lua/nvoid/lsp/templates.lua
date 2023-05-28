local M = {}

local Log = require "nvoid.core.log"
local utils = require "nvoid.utils"
local nvoid_lsp_utils = require "nvoid.lsp.utils"

local ftplugin_dir = nvoid.lsp.templates_dir

local join_paths = _G.join_paths

function M.remove_template_files()
  -- remove any outdated files
  for _, file in ipairs(vim.fn.glob(ftplugin_dir .. "/*.lua", 1, 1)) do
    vim.fn.delete(file)
  end
end

local skipped_filetypes = nvoid.lsp.automatic_configuration.skipped_filetypes
local skipped_servers = nvoid.lsp.automatic_configuration.skipped_servers
local ensure_installed_servers = nvoid.lsp.installer.setup.ensure_installed

---Check if we should skip generating an ftplugin file based on the server_name
---@param server_name string name of a valid language server
local function should_skip(server_name)
  -- ensure_installed_servers should take priority over skipped_servers
  return vim.tbl_contains(skipped_servers, server_name) and not vim.tbl_contains(ensure_installed_servers, server_name)
end

---Generates an ftplugin file based on the server_name in the selected directory
---@param server_name string name of a valid language server, e.g. pyright, gopls, tsserver, etc.
---@param dir string the full path to the desired directory
function M.generate_ftplugin(server_name, dir)
  if should_skip(server_name) then
    return
  end

  -- get the supported filetypes and remove any ignored ones
  local filetypes = vim.tbl_filter(function(ft)
    return not vim.tbl_contains(skipped_filetypes, ft)
  end, nvoid_lsp_utils.get_supported_filetypes(server_name) or {})

  if not filetypes then
    return
  end

  for _, filetype in ipairs(filetypes) do
    filetype = filetype:match "%.([^.]*)$" or filetype
    local filename = join_paths(dir, filetype .. ".lua")
    local setup_cmd = string.format([[require("nvoid.lsp.manager").setup(%q)]], server_name)
    -- print("using setup_cmd: " .. setup_cmd)
    -- overwrite the file completely
    utils.write_file(filename, setup_cmd .. "\n", "a")
  end
end

---Generates ftplugin files based on a list of server_names
---The files are generated to a runtimepath: "$NVOID_RUNTIME_DIR/site/after/ftplugin/template.lua"
---@param servers_names? table list of servers to be enabled. Will add all by default
function M.generate_templates(servers_names)
  servers_names = servers_names or nvoid_lsp_utils.get_supported_servers()

  Log:debug "Templates installation in progress"

  M.remove_template_files()

  -- create the directory if it didn't exist
  if not utils.is_directory(nvoid.lsp.templates_dir) then
    vim.fn.mkdir(ftplugin_dir, "p")
  end

  for _, server in ipairs(servers_names) do
    M.generate_ftplugin(server, ftplugin_dir)
  end
  Log:debug "Templates installation is complete"
end

return M
