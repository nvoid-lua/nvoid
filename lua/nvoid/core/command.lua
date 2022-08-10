-- Locals
local cmd = vim.cmd
local new_cmd = vim.api.nvim_create_user_command

-- Bufferline
new_cmd("BufNext", function()
  require("nvoid.core.utils").bufferlinenext()
end, {})
new_cmd("BufPrev", function()
  require("nvoid.core.utils").bufferlineprev()
end, {})
new_cmd("BufClose", function()
  vim.cmd [[bdelete %]]
end, {})

-- Nvoid
new_cmd("NvoidUpdater", function()
  _UPDATER()
end, {})
new_cmd("NvoidEditConfig", function()
  cmd [[ e ~/.config/nvim/lua/custom/nvoidrc.lua ]]
end, {})

-- Lsp
new_cmd("NvoidRename", function()
  require("nvoid.ui.rename").open()
end, {})
new_cmd("NvoidFormat", function()
  vim.lsp.buf.formatting()
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
