-- Local
local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')
-- Force Inactive
local force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
}
-- Components
local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}
-- Local colors
local colors = require("nvoid.colors")
-- vi mode colors
local vi_mode_colors = {
  NORMAL = 'green',
  OP = 'green',
  INSERT = 'red',
  VISUAL = 'blue',
  BLOCK = 'blue',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'green',
  SHELL = 'green',
  TERM = 'green',
  NONE = 'yellow'
}
-- vi mode text
local vi_mode_text = {
  NORMAL = '<|',
  OP = '<|',
  INSERT = '|>',
  VISUAL = '<>',
  LINES = '<>',
  BLOCK = '<>',
  REPLACE = '<>',
  ['V-REPLACE'] = '<>',
  ENTER = '<>',
  MORE = '<>',
  SELECT = '<>',
  COMMAND = '<|',
  SHELL = '<|',
  TERM = '<|',
  NONE = '<>'
}
-- Inactive File Types
force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'dashboard',
  'fugitive',
  'fugitiveblame'
}

-- Left
-- vi mode colors
components.active[1][1] = {
  provider = ' NVOID ',
  hl = function()
    local val = {}
    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'black'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- vi mode text
components.active[1][2] = {
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,
  hl = function()
    local val = {}
    val.fg = vi_mode_utils.get_mode_color()
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- File info
components.active[1][3] = {
  provider = 'file_info',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- Git Branch
components.active[1][4] = {
  provider = 'git_branch',
  hl = {
    fg = 'yellow',
    bg = 'bg',
    style = 'bold'
  }
}
-- Git add
components.active[1][5] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'bold'
  }
}
-- Git Changes
components.active[1][6] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold'
  }
}
-- Git Remove
components.active[1][7] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold'
  }
}
-- RIGHT
-- LSP Name
components.active[3][1] = {
  provider = 'lsp_client_names',
  icon = ' ',
  hl = {
    fg = 'violet',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- LSP Warning
components.active[3][2] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
}
-- LSP Error
components.active[3][3] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
}
-- LSP Hints
components.active[3][4] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
}
-- LSP Info
components.active[3][5] = {
  provider = 'diagnostic_info',
  right_sep = ' ',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}
-- File Position
components.active[3][6] = {
  provider = 'position',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = '  '
}
-- Scroll Bar
components.active[3][7] = {
  provider = 'scroll_bar',
  hl = {
    fg = 'yellow',
    bg = 'bg',
  },
}
-- INACTIVE
components.inactive[1][1] = {
  provider = 'file_type',
  hl = {
    fg = 'black',
    bg = 'blue',
    style = 'bold'
  },
  left_sep = {
    str = '',
    hl = {
      fg = 'NONE',
      bg = 'bg'
    }
  },
  right_sep = {
    {
      str = '',
      hl = {
        fg = 'NONE',
        bg = 'bg'
      }
    },
    ''
  }
}
-- Setup
require('feline').setup({
  colors = colors,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
