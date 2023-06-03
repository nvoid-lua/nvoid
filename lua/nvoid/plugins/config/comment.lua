local M = {}

function M.config()
  nvoid.builtin.comment = {
    active = true,
    on_config_done = nil,
    padding = true,
    sticky = true,
    ignore = "^$",
    mappings = {
      basic = true,
      extra = true,
    },
    toggler = {
      line = "gcc",
      block = "gbc",
    },
    opleader = {
      line = "gc",
      block = "gb",
    },
    extra = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },
    pre_hook = function(...)
      local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      if loaded and ts_comment then
        return ts_comment.create_pre_hook()(...)
      end
    end,
    post_hook = nil,
  }
end

function M.setup()
  local nvim_comment = require "Comment"
  nvim_comment.setup(nvoid.builtin.comment)
  if nvoid.builtin.comment.on_config_done then
    nvoid.builtin.comment.on_config_done(nvim_comment)
  end
end

return M
