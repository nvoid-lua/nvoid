local M = {}

local Log = require "nvoid.core.log"
local fmt = string.format
local if_nil = vim.F.if_nil

local function git_cmd(opts)
  local plenary_loaded, Job = pcall(require, "plenary.job")
  if not plenary_loaded then
    return 1, { "" }
  end

  opts = opts or {}
  opts.cwd = opts.cwd or get_nvoid_base_dir()

  local stderr = {}
  local stdout, ret = Job:new({
    command = "git",
    args = opts.args,
    cwd = opts.cwd,
    on_stderr = function(_, data)
      table.insert(stderr, data)
    end,
  }):sync()

  if not vim.tbl_isempty(stderr) then
    Log:debug(stderr)
  end

  if not vim.tbl_isempty(stdout) then
    Log:debug(stdout)
  end

  return ret, stdout, stderr
end

local function safe_deep_fetch()
  local ret, result, error = git_cmd { args = { "rev-parse", "--is-shallow-repository" } }
  if ret ~= 0 then
    Log:error(vim.inspect(error))
    return
  end
  -- git fetch --unshallow will cause an error on a complete clone
  local fetch_mode = result[1] == "true" and "--unshallow" or "--all"
  ret = git_cmd { args = { "fetch", fetch_mode } }
  if ret ~= 0 then
    Log:error(fmt "Git fetch %s failed! Please pull the changes manually in %s", fetch_mode, get_nvoid_base_dir())
    return
  end
  if fetch_mode == "--unshallow" then
    ret = git_cmd { args = { "remote", "set-branches", "origin", "*" } }
    if ret ~= 0 then
      Log:error(fmt "Git fetch %s failed! Please pull the changes manually in %s", fetch_mode, get_nvoid_base_dir())
      return
    end
  end
  return true
end

---pulls the latest changes from github
function M.update_base_nvoid()
  Log:info "Checking for updates"

  if not vim.loop.fs_access(get_nvoid_base_dir(), "w") then
    Log:warn(fmt("Nvoid update aborted! cannot write to %s", get_nvoid_base_dir()))
    return
  end

  if not safe_deep_fetch() then
    return
  end

  local ret

  ret = git_cmd { args = { "diff", "--quiet", "@{upstream}" } }
  if ret == 0 then
    Log:info "Nvoid is already up-to-date"
    return
  end

  ret = git_cmd { args = { "merge", "--ff-only", "--progress" } }
  if ret ~= 0 then
    Log:error("Update failed! Please pull the changes manually in " .. get_nvoid_base_dir())
    return
  end

  return true
end

---Switch Nvoid to the specified development branch
---@param branch string
function M.switch_nvoid_branch(branch)
  if not safe_deep_fetch() then
    return
  end
  local args = { "switch", branch }

  if branch:match "^[0-9]" then
    -- avoids producing an error for tags
    vim.list_extend(args, { "--detach" })
  end

  local ret = git_cmd { args = args }
  if ret ~= 0 then
    Log:error "Unable to switch branches! Check the log for further information"
    return
  end
  return true
end

---Get the current Nvoid development branch
---@return string|nil
function M.get_nvoid_branch()
  local _, results = git_cmd { args = { "rev-parse", "--abbrev-ref", "HEAD" } }
  local branch = if_nil(results[1], "")
  return branch
end

---Get currently checked-out tag of Nvoid
---@return string
function M.get_nvoid_tag()
  local args = { "describe", "--tags", "--abbrev=0" }

  local _, results = git_cmd { args = args }
  local tag = if_nil(results[1], "")
  return tag
end

---Get the description of currently checked-out commit of Nvoid
---@return string|nil
function M.get_nvoid_description()
  local _, results = git_cmd { args = { "describe", "--dirty", "--always" } }

  local description = if_nil(results[1], M.get_nvoid_branch())
  return description
end

---Get currently running version of Nvoid
---@return string
function M.get_nvoid_version()
  local current_branch = M.get_nvoid_branch()

  local nvoid_version
  if current_branch ~= "HEAD" or "" then
    nvoid_version = current_branch .. "-" .. M.get_nvoid_description()
  else
    nvoid_version = "v" .. M.get_nvoid_tag()
  end
  return nvoid_version
end

return M
