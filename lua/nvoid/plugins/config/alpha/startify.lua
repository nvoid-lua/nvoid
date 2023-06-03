local M = {}

function M.get_sections()
  local header = {
    type = "text",
    val = {
      [[ ]],
      [[  _   ___      ______ _____ _____   ]],
      [[ | \ | \ \    / / __ \_   _|  __ \  ]],
      [[ |  \| |\ \  / / |  | || | | |  | | ]],
      [[ | . ` | \ \/ /| |  | || | | |  | | ]],
      [[ | |\  |  \  / | |__| || |_| |__| | ]],
      [[ |_| \_|   \/   \____/_____|_____/  ]],
      [[ ]],
    },
    opts = {
      hl = "Label",
      shrink_margin = false,
      -- wrap = "overflow";
    },
  }

  local top_buttons = {
    entries = {
      { "o", nvoid.icons.ui.NewFile .. " New File", "<CMD>ene!<CR>" },
      { "e", nvoid.icons.ui.Gear .. " Configuration",
        "<CMD>edit " ..
        require("nvoid.config"):get_user_config_path() .. " <CR>", },
    },
  }

  local bottom_buttons = {
    entries = {
      { "q", "Quit", "<CMD>quit<CR>" },
    },
  }

  local footer = {
    type = "group",
  }

  return {
    header = header,
    top_buttons = top_buttons,
    bottom_buttons = bottom_buttons,
    -- this is probably broken
    footer = footer,
  }
end

return M
