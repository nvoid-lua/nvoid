local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

require("base16").load_highlight("dashboard")

local dashboard = require("alpha.themes.dashboard")
local text = require("ui.text")
local fn = vim.fn
local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

-- Header
local header = {
  type = "text",
  val = {
    "███╗   ██╗██╗   ██╗ ██████╗ ██╗██████╗",
    "████╗  ██║██║   ██║██╔═══██╗██║██╔══██╗",
    "██╔██╗ ██║██║   ██║██║   ██║██║██║  ██║",
    "██║╚██╗██║╚██╗ ██╔╝██║   ██║██║██║  ██║",
    "██║ ╚████║ ╚████╔╝ ╚██████╔╝██║██████╔╝",
    "╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚═╝╚═════╝",
  },
  opts = {
    position = "center",
    hl = "DashboardHeader",
  },
}

-- Buttons
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "DashboardCenter"
  b.opts.hl_shortcut = "DashboardShortcut"
  return b
end

local buttons = {
  type = "group",
  val = {
    button("f", "  Find file", ":Telescope find_files <CR>"),
    button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    button("o", "  Recent Files", ":Telescope oldfiles <CR>"),
    button("e", "  Configuration", ":e ~/.config/nvim/lua/custom/nvoidrc.lua <CR>"),
    button("u", "  Update plugins", ":PackerSync<CR>"),
    button("U", "ﮮ  Update Nvoid", ":NvoidUpdater<CR>"),
    button("q", "  Quit", ":qa<CR>"),
  },
  opts = {
    spacing = 0,
  },
}

local heading = {
  type = "text",
  val = text.align_center({ width = 0 }, { "Nvoid loaded " .. plugins_count .. " plugins  " }, 0.5),
  opts = {
    position = "center",
    hl = "DashboardShortcut",
  },
}

local nvoid_site = "爵nvoid.org"
local footer = {
  type = "text",
  val = text.align_center({ width = 0 }, { nvoid_site }, 0.5),
  opts = {
    position = "center",
    hl = "DashboardFooter",
  },
}

local opts = {
  layout = {
    { type = "padding", val = 5 },
    header,
    { type = "padding", val = 1 },
    heading,
    { type = "padding", val = 1 },
    buttons,
    { type = "padding", val = 1 },
    footer,
  },
  opts = {
    margin = 0,
  },
}

alpha.setup(opts)
