local M = {}

local terms = {
  types = { "horizontal", "vertical" },
  horizontal = {},
  vertical = {},
  last = nil,
  winsize = { vertical = 0.5, horizontal = 0.5 },
  location = {
    horizontal = "rightbelow",
    vertical = "rightbelow",
  },
}

local add_term = function(direction, term)
  table.insert(terms[direction], term)
  terms.last = term
end

local get_cmds = function(direction)
  local get_dims = function()
    local direction_switch = direction == "horizontal"
    local direction_func = direction_switch and vim.api.nvim_win_get_height or vim.api.nvim_win_get_width
    return math.floor(direction_func(0) * terms.winsize[direction])
  end
  local term_cmds = function(dims)
    if direction == "horizontal" then
      return { new = terms.location.horizontal .. dims .. " split" }
    end
    return { new = terms.location.vertical .. dims .. " vsplit" }
  end
  return term_cmds(get_dims()).new
end

local last_direction = function(direction)
  return terms[direction][#terms[direction]]
end

M.hide_term = function(term)
  term.open = false
  vim.api.nvim_win_hide(term.win)
end

M.show_term = function(term)
  term.open = true
  vim.cmd(get_cmds(term.type))
  term.win = vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(term.win)
  vim.api.nvim_set_current_buf(term.buf)
  vim.api.nvim_input("i") --term enter
end

M.hide = function(direction)
  local term = direction and last_direction(direction) or terms.last
  M.hide_term(term)
end

M.show = function(direction)
  local term = direction and last_direction(direction) or terms.last
  M.show_term(term)
end

M.new = function(direction)
  local create_term = function()
    vim.cmd(get_cmds(direction))
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(false, true)
    return { win = win, buf = buf, open = true, type = direction }
  end
  local term = create_term()
  add_term(direction, term)
  vim.api.nvim_win_set_buf(term.win, term.buf)
  vim.cmd("term")
  vim.api.nvim_buf_set_option(term.buf, "buflisted", false)
end

local verify_terminals = function()
  for _, type in ipairs(terms.types) do
    terms[type] = vim.tbl_filter(function(term)
      return vim.api.nvim_buf_is_valid(term.buf)
    end, terms[type])
  end
end

M.new_or_toggle = function(direction)
  verify_terminals()
  local term = last_direction(direction)
  if vim.tbl_isempty(terms[direction]) then
    M.new(direction)
    return
  end
  if term.open then
    M.hide_term(term)
    return
  end
  M.show_term(term)
end

local config_handler = function(config)
  local behavior_handler = function(behavior)
    if behavior.close_on_exit then
      vim.cmd("au TermClose * lua vim.api.nvim_input('<CR>')")
    end
    vim.cmd([[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal | startinsert]])
  end
  behavior_handler(config["behavior"])
  terms.winsize["horizontal"] = config.window.split_ratio or 0.5
  terms.winsize["vertical"] = config.window.vsplit_ratio or 0.5
  terms.location = config.location or terms.location
end

M.init = function()
  config_handler(nvoid.terminal)
end

return M
