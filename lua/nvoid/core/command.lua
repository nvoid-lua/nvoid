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
    vim.lsp.buf.formatting_seq_sync()
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

new_cmd("FTermOpen", function()
  require("FTerm").open()
end, {})

new_cmd("ToggleTerm", function()
  cmd([[call TermToggle(12)]])
end, {})

-- Rename
new_cmd("NvoidRename", function()
  require("nvoid.ui.rename").open()
end, {})

if require("nvoid.core.utils").load_config().ui.bufferline.enabled then
  -- Bufferline
  new_cmd("BufNext", function()
    require("nvoid.builtin.bufferline.utils").bufferlinenext()
  end, {})
  new_cmd("BufPrev", function()
    require("nvoid.builtin.bufferline.utils").bufferlineprev()
  end, {})
  new_cmd("BufClose", function()
    vim.cmd([[bdelete %]])
  end, {})
  new_cmd("BufPick", function()
    vim.g.bufpick_showNums = true
    vim.cmd("redrawtabline")
    vim.api.nvim_echo({ { "Enter Num ", "Question" } }, false, {})
    local key = tonumber(vim.fn.nr2char(vim.fn.getchar()))
    if key then
      vim.cmd("b" .. vim.t.bufs[key])
      vim.api.nvim_echo({ { "" } }, false, {})
      vim.cmd("redraw")
    else
      vim.cmd("redraw")
      print("bufpick cancelled, press a number key!")
    end
    vim.g.bufpick_showNums = false
    vim.cmd("redrawtabline")
  end, {})
end
