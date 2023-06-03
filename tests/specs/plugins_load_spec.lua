local a = require "plenary.async_lib.tests"

a.describe("plugin-loader", function()
  local plugins = require "nvoid.plugins"
  local loader = require "nvoid.plugin-loader"

  pcall(function()
    nvoid.log.level = "debug"
    package.loaded["nvoid.core.log"] = nil
  end)

  a.it("should be able to load default packages without errors", function()
    vim.go.loadplugins = true
    loader.load { plugins, nvoid.plugins }

    -- TODO: maybe there's a way to avoid hard-coding the names of the modules?
    local startup_plugins = {
      "lazy",
    }

    for _, plugin in ipairs(startup_plugins) do
      assert.truthy(package.loaded[plugin])
    end
  end)

  a.it("should be able to load lsp packages without errors", function()
    require("nvoid.lsp").setup()

    local lsp_packages = {
      "lspconfig",
      "nlspsettings",
      "null-ls",
    }

    for _, plugin in ipairs(lsp_packages) do
      assert.truthy(package.loaded[plugin])
    end
  end)
end)
