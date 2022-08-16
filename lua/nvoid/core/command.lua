-- Locals
local cmd = vim.cmd
local new_cmd = vim.api.nvim_create_user_command

-- Nvoid
new_cmd("NvoidUpdater", function()
  require("nvoid.core.utils").update_nvoid()
end, {})
new_cmd("NvoidEditConfig", function()
  cmd([[ e ~/.config/nvim/lua/custom/nvoidrc.lua ]])
end, {})

-- Lsp
new_cmd("NvoidFormat", function()
  if vim.g.vim_version > 7 then
    vim.lsp.buf.format({ async = true })
  else
    vim.lsp.buf.formatting()
  end
end, {})
new_cmd("NvoidDiagnostics", function()
  vim.diagnostic.open_float(0, { show_header = false, severity_sort = true, scope = "line" })
end, {})

-- Comment
new_cmd("NvoidComment", function()
  require("Comment.api").toggle_current_linewise()
end, {})
new_cmd("NvoidCommentV", function()
  require("Comment.api").toggle_linewise_op(vim.fn.visualmode())
end, {})
