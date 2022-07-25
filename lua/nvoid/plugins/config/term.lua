local present, toggleterm = pcall(require, "toggleterm")

if not present then
  return
end

toggleterm.setup {
  on_config_done = nil,
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = false,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local present2, toggletermup = pcall(require, "toggleterm.terminal")
if not present2 then
  return
end

local Terminal = toggletermup.Terminal
local updater = Terminal:new {
  direction = "float",
  dir = "~/.config/nvim/scripts",
  cmd = "bash ./updater.sh",
  hidden = true,
  on_close = function()
    vim.notify "Please Restart Nvoid"
  end, -- function to run when the terminal closes
}

function _UPDATER()
  updater:toggle()
end
