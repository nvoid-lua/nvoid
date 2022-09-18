local utils = require "nvoid.builtin.updater.utils"
local prompts = require "nvoid.builtin.updater.utils.prompts"
local echo = utils.echo

-- replace any occurances of old_text in text_list with new_text
local function list_text_replace(text_list, old_text, new_text)
  for i, v in ipairs(text_list) do
    if type(v) == "string" then
      text_list[i] = v:gsub(old_text, new_text)
    else
      list_text_replace(v, old_text, new_text)
    end
  end
  return text_list
end

M = {}

-- replace any occurances of old_text in text_list with new_text
M.list_text_replace = function(text_list, old_text, new_text)
  if type(old_text) == "table" and type(new_text) == "table" and #old_text == #new_text then
    for i, v in ipairs(old_text) do
      list_text_replace(text_list, v, new_text[i])
    end
  elseif type(old_text) == "string" and type(new_text) == "string" then
    list_text_replace(text_list, old_text, new_text)
  end
  return text_list
end

-- print the passed symbol print_count amount of times
M.print_padding = function(symbol, repeat_count)
  local padding = ""

  while repeat_count > 0 do
    padding = padding .. symbol
    repeat_count = repeat_count - 1
  end

  echo { { padding } }
end

-- prompt the user to execute PackerSync
M.packer_sync = function()
  echo(prompts.packer_sync)
  local ans = string.lower(vim.fn.input "-> ") == "y"
  return ans
end

-- print a progress message
M.print_progress_percentage = function(text, text_type, current, total, clear)
  local percent = math.floor(current / total * 100) or 0

  if clear then
    utils.clear_last_echo()
  end

  echo { { text .. " (" .. current .. "/" .. total .. ") " .. percent .. "%", text_type } }
end

-- create a dictionary of human readable strings
M.get_human_readables = function(count)
  local human_readable_dict = {}
  human_readable_dict["have"] = count > 1 and "have" or "has"
  human_readable_dict["commits"] = count > 1 and "commits" or "commit"
  human_readable_dict["change"] = count > 1 and "changes" or "change"
  return human_readable_dict
end

return M
