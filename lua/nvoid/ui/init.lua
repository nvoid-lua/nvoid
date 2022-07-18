local utils = require "nvoid.ui.utils"
local M = {}

local default_border = "single"
local default_user_opts = {
  notify_title = "Nvoid",
  border_style = default_border,
  rename = {
    border = {
      highlight = "FloatBorder",
      style = nil,
      title = "Rename",
      title_align = "left",
      title_hl = "FloatBorder",
    },
    prompt = "> ",
    prompt_hl = "Comment",
  },
  code_actions = {
    min_width = nil,
    border = {
      bottom_hl = "FloatBorder",
      highlight = "FloatBorder",
      style = nil,
      title = "Code Actions",
      title_align = "center",
      title_hl = "FloatBorder",
    },
  },
}

_G.Nvoid_user_opts = {
  border_style = "single",
  rename = {
    border = {
      highlight = "FloatBorder",
      style = "single",
      title = " Rename ",
      title_align = "left",
      title_hl = "FloatBorder",
    },
    prompt = "> ",
    prompt_hl = "Comment",
  },
  code_actions = {
    min_width = nil,
    border = {
      bottom_hl = "FloatBorder",
      highlight = "FloatBorder",
      style = "single",
      title = "Code Actions",
      title_align = "center",
      title_hl = "FloatBorder",
    },
  },
}

M.setup = function(user_opts)
  _G.Nvoid_user_opts = utils.merge(default_user_opts, user_opts or {})
  user_opts = _G.Nvoid_user_opts
end

M.rename = function(popup_opts, opts)
  return require "nvoid.ui.rename" (popup_opts, opts)
end

M.code_actions = function(opts)
  require("nvoid.ui.code-action").code_actions(opts)
end

M.range_code_actions = function(opts)
  opts = utils.merge({
    params = vim.lsp.util.make_given_range_params(),
  }, opts or {})
  M.code_actions(opts)
end

return M
