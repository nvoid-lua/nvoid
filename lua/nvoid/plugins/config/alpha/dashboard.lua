local M = {}

M.banner = {
  "⠘⢵⢕⢽⡸⣕⢵⢝⡄⠀⠑⡽⡸⡄⠹⡜⣝⡄⠀⠀⠀⠀⠀⡔⡽⡸⠁",
  "⠀⠈⣗⡳⣉⠈⠸⣕⢝⣄⠀⠘⣝⢮⣂⠙⣜⢮⢆⠀⠀⢀⢜⡎⡗⠁ ",
  "⠀⠀⠐⢝⢼⢄⠀⠘⡵⣕⢆⠀⠘⣎⢮⢆⠘⡎⡗⡧⡀⣎⢧⡫⠀  ",
  "   ⠈⢳⡹⣢⠀⠘⢮⢝⢦⠀⠈⢮⢳⡱⡈⢗⡕⣗⢕⠇⠀⠀  ",
  "   ⠀⠀⢫⢮⣢⠀⠈⢮⢳⢕⡀⠈⢧⢳⢕⡀⢯⢪⠋⠀    ",
  "   ⠀⠀⠀⢣⡳⣕⡀⠈⢣⢗⢵⡀⠈⢮⢳⡱⡀⠋⠀     ",
  "    ⠀⠀⠀⠱⡵⣱⡀⠀⢫⣣⢳⢄⢠⡳⣹⠕⠀      ",
  "   ⠀⠀⠀⠀⠀⠹⣜⢼⡀⠀⠪⡳⡕⣗⢝⠊⠀       ",
  "   ⠀     ⠘⡮⡺⡄⠀⠙⡼⣪⠃         ",
  "   ⠀     ⠀⠘⡵⡝⣆⠀⠘⠁          ",
  "   ⠀     ⠀⠀⠘⡺⡜⣆⠀           ",
  "            ⠈⢞⠁            ",
}

function M.get_sections()
  local header = {
    type = "text",
    val = M.banner,
    opts = {
      position = "center",
      hl = "Label",
    },
  }

  local text = require "nvoid.ui.text"

  local footer = {
    type = "text",
    val = text.align_center({ width = 0 }, { "爵nvoid.org" }, 0.5),
    opts = {
      position = "center",
      hl = "Number",
    },
  }

  local buttons = {
    opts = {
      hl_shortcut = "Include",
      spacing = 1,
    },
    entries = {
      { "f", nvoid.icons.ui.FindFile .. "  Find File",   "<CMD>Telescope find_files<CR>" },
      { "n", nvoid.icons.ui.NewFile .. "  New File",     "<CMD>ene!<CR>" },
      { "o", nvoid.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
      { "e", nvoid.icons.ui.Gear .. "  Configuration",
        "<CMD>edit " ..
        require("nvoid.config"):get_user_config_path() .. " <CR>", },
      { "t", nvoid.icons.ui.FindText .. "  Find Text",      "<CMD>Telescope live_grep<CR>" },
      { "u", nvoid.icons.ui.ArrowCircleUp .. "  Update Nvoid", "<CMD>NvoidUpdate<CR>" },
      { "q", nvoid.icons.ui.Close .. "  Quit",              "<CMD>:qa<CR>" },
    },
  }
  return {
    header = header,
    buttons = buttons,
    footer = footer,
  }
end

return M
