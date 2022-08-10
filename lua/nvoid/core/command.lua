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

new_cmd("TbufPick", function()
  vim.g.bufpick_showNums = true
  vim.cmd "redrawtabline"
  vim.api.nvim_echo({ { "Enter Num ", "Question" } }, false, {})
  local key = tonumber(vim.fn.nr2char(vim.fn.getchar()))
  if key then
    vim.cmd("b" .. vim.t.bufs[key])
    vim.api.nvim_echo({ { "" } }, false, {})
    vim.cmd "redraw"
  else
    vim.cmd "redraw"
    print "bufpick cancelled, press a number key!"
  end
  vim.g.bufpick_showNums = false
  vim.cmd "redrawtabline"
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
