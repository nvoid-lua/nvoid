local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

local icons = {
    linux = ' ',
    macos = ' ',
    windows = ' ',
    lsp = ' ',
    git = ''
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = icons.linux
    elseif os == 'MAC' then
        icon = icons.macos
    else
        icon = icons.windows
    end
    return icon .. os
end

local colors = require("colors")

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

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'dashboard',
  'fugitive',
  'fugitiveblame'
}


-- LEFT

-- vi-mode
components.active[1][1] = {
  provider = '▊',
  hl = function()
    local val = {}

    val.bg = vi_mode_utils.get_mode_color()
    val.fg = vi_mode_utils.get_mode_color()
    val.style = 'bold'

    return val
  end,
  right_sep = ' '
}

-- filename
components.active[1][2] = {
  provider = 'file_info',
  hl = {
    fg = 'blue',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
components.active[1][3] = {
  provider = 'lsp_client_names',
  icon = icons.lsp,
  hl = {
    fg = 'yellow',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
components.active[1][4] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'yellow',
    style = 'bold'
  }
}
components.active[1][5] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'red',
    style = 'bold'
  }
}
components.active[1][6] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'cyan',
    style = 'bold'
  }
}
components.active[1][7] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'skyblue',
    style = 'bold'
  }
}

components.active[3][1] = {
  provider = 'git_diff_added',
  right_sep = ' ',
  hl = {
    fg = 'green',
    bg = 'bg',
    style = 'bold',
    left_sep = '  '
  }
}

components.active[3][2] = {
  provider = 'git_diff_changed',
  right_sep = ' ',
  hl = {
    fg = 'orange',
    bg = 'bg',
    style = 'bold',
    left_sep = '  '
  }
}

components.active[3][3] = {
  provider = 'git_diff_removed',
  right_sep = ' ',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold',
    left_sep = '  '
  }
}

components.active[3][4] = {
  provider = file_osinfo,
  right_sep = ' ',
  hl = {
    fg = 'violet',
    bg = 'bg',
    style = 'bold',
    left_sep = '  '
  }
}

components.active[3][5] = {
  provider = 'git_branch',
  right_sep = ' ',
  icon = icons.git,
  hl = {
    fg = 'violet',
    bg = 'bg',
    style = 'bold',
    left_sep = '  '
  }
}

components.active[3][6] = {
  provider = 'line_percentage',
  right_sep = ' ',
  hl = {
    style = 'bold',
  }
}

components.active[3][7] = {
  provider = 'scroll_bar',
  right_sep = ' ',
  hl = {
    fg = 'blue',
    bg = 'bg',
  },
}

components.active[3][8] = {
  provider = '▊',
  hl = function()
    local val = {}

    val.bg = vi_mode_utils.get_mode_color()
    val.fg = vi_mode_utils.get_mode_color()
    val.style = 'bold'

    return val
  end,
  right_sep = ''
}

components.inactive[1][1] = {
  provider = '',
  hl = {
    fg = 'black',
    bg = 'bg',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'bg'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'bg'
      }
    },
    ' '
  }
}

require('feline').setup({
  colors = colors,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
