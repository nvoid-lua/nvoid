return function(ft)
  local function tbl_set_highlight(terms, highlight_group)
    for _, v in pairs(terms) do
      vim.cmd('let m=matchadd("' .. highlight_group .. '", "' .. v .. "[ ,│']\")")
      vim.cmd('let m=matchadd("' .. highlight_group .. '", ", ' .. v .. '")')
    end
  end

  vim.fn.matchadd("NvoidInfoHeaderBuffer", "Buffer Info")
  vim.fn.matchadd("NvoidInfoHeaderLsp", "Active Client(s)")
  vim.fn.matchadd("NvoidInfoHeaderLint", "Formatters and Linters")
  vim.fn.matchadd("NvoidInfoHeaderFormat", "Nvoid Info")
  vim.fn.matchadd("NvoidInfoIdentifier", ft .. "$")
  vim.fn.matchadd("NvoidInfoBullet", nvoid.icons.ui.spinnerActive)
  vim.fn.matchadd("string", "true")
  vim.fn.matchadd("string", "active")
  vim.fn.matchadd("string", nvoid.icons.ui.BoxChecked)
  vim.fn.matchadd("boolean", "inactive")
  vim.fn.matchadd("error", "false")
  tbl_set_highlight(require("nvoid.lsp.null-ls.formatters").list_registered(ft), "NvoidInfoIdentifier")
  tbl_set_highlight(require("nvoid.lsp.null-ls.linters").list_registered(ft), "NvoidInfoIdentifier")
  tbl_set_highlight(require("nvoid.lsp.null-ls.code_actions").list_registered(ft), "NvoidInfoIdentifier")
end
