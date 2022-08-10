local M = {}

M.colorizer = function()
  local present, colorizer = pcall(require, "colorizer")
  if present then
    colorizer.setup({ "*" }, {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = false,
      rgb_fn = false,
      hsl_fn = false,
      css = false,
      css_fn = false,
      mode = "background",
    })
  end
end

M.indent = function()
  local status_ok, indent = pcall(require, "indent_blankline")
  if not status_ok then
    return
  end

  indent.setup {
    show_current_context = true,
  }
  vim.opt.list = true
end

M.commet = function()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end
  comment.setup {
    padding = true,
    ignore = "^$",
    mappings = {
      basic = true,
      extra = false,
    },
    toggler = {
      line = "gcc",
      block = "gbc",
    },
    opleader = {
      line = "gc",
      block = "gb",
    },
    pre_hook = nil,
    post_hook = nil,
  }
end

M.luasnip = function()
  local present, luasnip = pcall(require, "luasnip")

  if not present then
    return
  end

  local options = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }

  luasnip.config.set_config(options)
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.luasnippets_path or "" }

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
          and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end,
  })
end

M.devicons = function()
  local present, devicons = pcall(require, "nvim-web-devicons")

  if present then
    local options = { override = require("ui.icons").devicons }
    devicons.setup(options)
  end
end

return M
