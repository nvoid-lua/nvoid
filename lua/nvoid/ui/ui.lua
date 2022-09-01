local config = require("nvoid.core.utils").load_config()
local opt = vim.opt
if config.ui.statusline.enabled then
  opt.statusline = config.ui.statusline.config
end

if config.ui.bufferline.enabled then
  vim.opt.tabline = "%!v:lua.require'nvoid.ui.bufferline'.run()"
  if config.ui.bufferline.always_show then
    vim.opt.showtabline = 2
  else
    local autocmd = vim.api.nvim_create_autocmd
    autocmd({ "BufNewFile", "BufRead", "TabEnter" }, {
      pattern = "*",
      callback = function()
        if #vim.fn.getbufinfo({ buflisted = 1 }) >= 2 then
          vim.opt.showtabline = 2
        else
          vim.opt.showtabline = 0
        end
      end,
    })
  end
end
