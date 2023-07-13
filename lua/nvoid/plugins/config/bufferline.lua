local M = {}

function M.config()
  nvoid.builtin.bufferline = {
    active = false,
    setup = {
      always_show = false,
      show_numbers = false,
      kind_icons = true,
      icons = {
        unknown_file = nvoid.icons.ui.File,
        close = nvoid.icons.ui.Close,
        modified = nvoid.icons.ui.Circle,
        tab = nvoid.icons.ui.Tab,
        tab_close = nvoid.icons.ui.BoldClose,
        tab_toggle = nvoid.icons.ui.ArrowCircleLeft,
        tab_add = nvoid.icons.ui.Add,
      },
    },
  }
end

function M.setup()
  require("bufferline").setup(nvoid.builtin.bufferline.setup)
end

return M
