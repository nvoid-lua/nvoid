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
   keymaps = {
      -- Default keymap options
      noremap = true,

      ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
      ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

      ['n <c-s>'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['v <c-s>'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <c-u>'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <c-r>'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v <c-r>'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <c-R>'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ['n <c-p>'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <c-b>'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
      ['n <c-S>'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
      ['n <c-U>'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
   },
  }
end
