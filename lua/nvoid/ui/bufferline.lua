local api = vim.api
local devicons_present, devicons = pcall(require, "nvim-web-devicons")
local fn = vim.fn

vim.cmd "function! GoToBuf(bufnr,b,c,d) \n execute 'b'..a:bufnr \n endfunction"

vim.cmd [[
  function! KillBuf(bufnr,b,c,d)
    call luaeval('require("nvoid.core.utils").bufferclose(_A)', a:bufnr)
  endfunction]]

vim.cmd "function! NewTab(a,b,c,d) \n tabnew \n endfunction"
vim.cmd "function! GotoTab(tabnr,b,c,d) \n execute a:tabnr ..'tabnext' \n endfunction"
vim.cmd "function! TabClose(a,b,c,d) \n lua require('nvoid.core.utils').closeallbufs('closeTab') \n endfunction"
vim.cmd "function! CloseAllBufs(a,b,c,d) \n lua require('nvoid.core.utils').closeallbufs() \n endfunction"
vim.cmd "function! ToggleTabs(a,b,c,d) \n let g:TabsToggled = !g:TabsToggled | redrawtabline \n endfunction"

-------------------------------------------------------- functions ------------------------------------------------------------
local function new_hl(group1, group2)
  local fg = fn.synIDattr(fn.synIDtrans(fn.hlID(group1)), "fg#")
  local bg = fn.synIDattr(fn.synIDtrans(fn.hlID(group2)), "bg#")
  api.nvim_set_hl(0, "line" .. group1 .. group2, { fg = fg, bg = bg })
  return "%#" .. "line" .. group1 .. group2 .. "#"
end

local function getNvimTreeWidth()
  for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
    if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

local function getnsWidth()
  local width = 6
  if fn.tabpagenr "$" ~= 1 then
    width = width + ((3 * fn.tabpagenr "$") + 2) + 10
    width = not vim.g.TabsToggled and 8 or width
  end
  return width
end

local function add_fileInfo(name, bufnr)
  if devicons_present then
    local icon, icon_hl = devicons.get_icon(name, string.match(name, "%a+$"))

    if not icon then
      icon, icon_hl = devicons.get_icon "default_icon"
    end

    local fileInfo = " " .. icon .. " " .. name .. " " -- initial value
    local pad = (24 - #fileInfo) / 2

    icon = (
      api.nvim_get_current_buf() == bufnr and new_hl(icon_hl, "LineBufOn") .. " " .. icon
      or new_hl(icon_hl, "LineBufOff") .. " " .. icon
    )

    name = (#name > 15 and string.sub(name, 1, 13) .. "..") or name
    name = (api.nvim_get_current_buf() == bufnr and "%#LineBufOn# " .. name .. " ")
      or ("%#LineBufOff# " .. name .. " ")

    return string.rep(" ", pad) .. icon .. name .. string.rep(" ", pad - 1)
  end
end

local function styleBufferTab(nr)
  local close_btn = "%" .. nr .. "@KillBuf@ %X"
  local name = (#api.nvim_buf_get_name(nr) ~= 0) and fn.fnamemodify(api.nvim_buf_get_name(nr), ":t") or " No Name "
  name = "%" .. nr .. "@GoToBuf@" .. add_fileInfo(name, nr) .. "%X"

  -- color close btn for focused / hidden  buffers
  if nr == api.nvim_get_current_buf() then
    close_btn = (vim.bo[0].modified and "%" .. nr .. "@KillBuf@%#LineBufOnModified# ")
      or ("%#LineBufOnClose#" .. close_btn)
    name = "%#LineBufOn#" .. name .. close_btn
  else
    close_btn = (vim.bo[nr].modified and "%" .. nr .. "@KillBuf@%#BufLineBufOffModified# ")
      or ("%#LineBufOffClose#" .. close_btn)
    name = "%#LineBufOff#" .. name .. close_btn
  end

  return name
end

---------------------------------------------------------- components ------------------------------------------------------------
local M = {}

M.CoverNvimTree = function()
  return "%#NvimTreeNormal#" .. string.rep(" ", getNvimTreeWidth())
end

M.bufferlist = function()
  local buffers = {} -- buffersults
  local available_space = vim.o.columns - getNvimTreeWidth() - getnsWidth()
  local current_buf = api.nvim_get_current_buf()
  local has_current = false -- have we seen current buffer yet?

  for _, bufnr in ipairs(vim.t.bufs) do
    if api.nvim_buf_is_valid(bufnr) then
      if ((#buffers + 1) * 21) > available_space then
        if has_current then
          break
        end

        table.remove(buffers, 1)
      end

      has_current = (bufnr == current_buf and true) or has_current
      table.insert(buffers, styleBufferTab(bufnr))
    end
  end

  return table.concat(buffers) .. "%#lineFill#" .. "%=" -- buffers + empty space
end

vim.g.TabsToggled = 0

M.tablist = function()
  local result, number_of_tabs = "", fn.tabpagenr "$"

  if number_of_tabs > 1 then
    for i = 1, number_of_tabs, 1 do
      local tab_hl = ((i == fn.tabpagenr()) and "%#LineTabOn# ") or "%#LineTabOff# "
      result = result .. ("%" .. i .. "@GotoTab@" .. tab_hl .. i .. " ")
      result = (i == fn.tabpagenr() and result .. "%#LineTabCloseBtn#" .. "%@TabClose@ %X") or result
    end

    local tabstoggleBtn = "%@ToggleTabs@ %#TabTitle#%X"

    return vim.g.TabsToggled == 1 and tabstoggleBtn:gsub("()", { [36] = " " })
      or tabstoggleBtn .. result
  end
end

M.buttons = function()
  local CloseAllBufsBtn = "%@CloseAllBufs@%#LineCloseAllBufsBtn#" .. "  " .. "%X"
  return CloseAllBufsBtn
end

M.run = function()
  return M.CoverNvimTree() .. M.bufferlist() .. (M.tablist() or "") .. M.buttons()
end

return M
