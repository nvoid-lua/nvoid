local config = require("nvoid.core.utils").load_config()
------ impatient ------
vim.defer_fn(function()
  require("nvoid.builtin.impatient")
end, 0)

------ terminal ------
vim.schedule_wrap(require("nvoid.builtin.terminal").init())

------ StatusLine ------
local opt = vim.opt
if config.ui.statusline.enabled then
  opt.statusline = config.ui.statusline.config
end

------ Bufferline ------
if config.ui.bufferline.enabled then
  local present = pcall(require, "nvim-web-devicons")
  if not present then
    vim.opt.tabline = "%!v:lua.require'nvoid.builtin.bufferline'.run()"
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
end
