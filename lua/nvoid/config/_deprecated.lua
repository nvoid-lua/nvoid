---@diagnostic disable: deprecated
local M = {}

local function deprecate(name, alternative)
  local in_headless = #vim.api.nvim_list_uis() == 0
  if in_headless then
    return
  end

  alternative = alternative or "See https://github.com/nvoid-lua/nvoid#breaking-changes"

  local trace = debug.getinfo(3, "Sl")
  local shorter_src = trace.short_src
  local t = shorter_src .. ":" .. (trace.currentline or trace.lastlinedefined)
  vim.schedule(function()
    vim.notify_once(string.format("%s: `%s` is deprecated.\n %s.", t, name, alternative), vim.log.levels.WARN)
  end)
end

function M.handle()
  local mt = {
    __newindex = function(_, k, _)
      deprecate(k)
    end,
  }

  ---@deprecated
  nvoid.builtin.notify = {}
  setmetatable(nvoid.builtin.notify, {
    __newindex = function(_, k, _)
      deprecate("nvoid.builtin.notify." .. k, "See Nvoid#3294")
    end,
  })

  ---@deprecated
  nvoid.builtin.dashboard = {}
  setmetatable(nvoid.builtin.dashboard, {
    __newindex = function(_, k, _)
      deprecate("nvoid.builtin.dashboard." .. k, "Use `nvoid.builtin.alpha` instead. See Nvoid#1906")
    end,
  })

  ---@deprecated
  nvoid.lsp.popup_border = {}
  setmetatable(nvoid.lsp.popup_border, mt)

  ---@deprecated
  nvoid.lsp.float = {}
  setmetatable(nvoid.lsp.float, {
    __newindex = function(_, k, _)
      deprecate("nvoid.lsp.float." .. k, "Use options provided by the handler instead")
    end,
  })

  ---@deprecated
  nvoid.lsp.diagnostics = {}
  setmetatable(nvoid.lsp.diagnostics, {
    __newindex = function(table, k, v)
      deprecate("nvoid.lsp.diagnostics." .. k, string.format("Use `vim.diagnostic.config({ %s = %s })` instead", k, v))
      rawset(table, k, v)
    end,
  })

  ---@deprecated
  nvoid.lang = {}
  setmetatable(nvoid.lang, mt)
end

function M.post_load()
  if nvoid.lsp.diagnostics and not vim.tbl_isempty(nvoid.lsp.diagnostics) then
    vim.diagnostic.config(nvoid.lsp.diagnostics)
  end

  if nvoid.lsp.override and not vim.tbl_isempty(nvoid.lsp.override) then
    deprecate("nvoid.lsp.override", "Use `nvoid.lsp.automatic_configuration.skipped_servers` instead")
    vim.tbl_map(function(c)
      if not vim.tbl_contains(nvoid.lsp.automatic_configuration.skipped_servers, c) then
        table.insert(nvoid.lsp.automatic_configuration.skipped_servers, c)
      end
    end, nvoid.lsp.override)
  end

  if nvoid.autocommands.custom_groups then
    deprecate(
      "nvoid.autocommands.custom_groups",
      "Use vim.api.nvim_create_autocmd instead or check Nvoid#2592 to learn about the new syntax"
    )
  end

  if nvoid.lsp.automatic_servers_installation then
    deprecate(
      "nvoid.lsp.automatic_servers_installation",
      "Use `nvoid.lsp.installer.setup.automatic_installation` instead"
    )
  end

  local function convert_spec_to_lazy(spec)
    local alternatives = {
      setup = "init",
      as = "name",
      opt = "lazy",
      run = "build",
      lock = "pin",
      requires = "dependencies",
    }

    alternatives.tag = function()
      if spec.tag == "*" then
        spec.version = "*"
        return [[version = "*"]]
      end
    end

    alternatives.disable = function()
      if type(spec.disabled) == "function" then
        spec.enabled = function()
          return not spec.disabled()
        end
      else
        spec.enabled = not spec.disabled
      end
      return "enabled = " .. vim.inspect(spec.enabled)
    end

    alternatives.wants = function()
      return "dependencies = [value]"
    end
    alternatives.needs = alternatives.wants

    alternatives.module = function()
      spec.lazy = true
      return "lazy = true"
    end

    for old_key, alternative in pairs(alternatives) do
      if spec[old_key] ~= nil then
        local message
        local old_value = vim.inspect(spec[old_key]) or "value"

        if type(alternative) == "function" then
          message = alternative()
        else
          spec[alternative] = spec[old_key]
        end

        -- not every function in alternatives returns a message (e.g. tag)
        if type(alternative) ~= "function" or message then
          spec[old_key] = nil

          local new_value = vim.inspect(spec[alternative] or "[value]")
          message = message or string.format("%s = %s", alternative, new_value)
          vim.schedule(function()
            vim.notify_once(
              string.format(
                [[`%s = %s` in `nvoid.plugins` has been deprecated since the migration to lazy.nvim. Use `%s` instead.
Example:
`nvoid.plugins = {... {... %s = %s ...} ...}`
->
`nvoid.plugins = {... {... %s ...} ...}`
See https://github.com/folke/lazy.nvim#-migration-guide"]],
                old_key,
                old_value,
                message,
                old_key,
                old_value,
                message
              ),
              vim.log.levels.WARN
            )
          end)
        end
      end
    end

    if spec[1] and spec[1]:match "^http" then
      spec.url = spec[1]
      spec[1] = nil

      vim.schedule(function()
        vim.notify_once(

          string.format(
            [[`"http..."` in `nvoid.plugins` has been deprecated since the migration to lazy.nvim. Use `url = "http..."` instead.
Example:
`nvoid.plugins = {... { "%s" ...} ...}`
->
`nvoid.plugins = {... { url = "%s" ...} ...}`
See https://github.com/folke/lazy.nvim#-migration-guide"]],
            spec.url,
            spec.url
          ),

          vim.log.levels.WARN
        )
      end)
    end
  end

  for _, plugin in ipairs(nvoid.plugins) do
    if type(plugin) == "table" then
      convert_spec_to_lazy(plugin)
    end
  end
end

return M
