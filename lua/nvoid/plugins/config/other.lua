local M = {}

-- Auto Pairs
M.autopairs = function ()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

    if present1 and present2 then
       autopairs.setup()
       local cmp = require "cmp"
       cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
       cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
    end
end

-- Commented
M.commented = function ()
  local present, commented = pcall(require, "commented")
  if not present then
     return
  end
  commented.setup({
	  keybindings = { n = "<leader>/", v = "<leader>/", nl = "<leader>/" },
      comment_padding = " ",
  })
end

-- Git Signs
M.git = function ()
  local present, gitsigns = pcall(require, "gitsigns")
  if present then
    gitsigns.setup {
      signs = {
      add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
    }
  end
end

-- colorizer
M.colorizer = function ()
  local present, colorizer = pcall(require, "colorizer")
  if present then
    colorizer.setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode.
     })
  end
end

--

return M
