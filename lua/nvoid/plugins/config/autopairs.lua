local M = {}

function M.config()
  nvoid.builtin.autopairs = {
    active = true,
    on_config_done = nil,
    map_char = {
      all = "(",
      tex = "{",
    },
    enable_check_bracket_line = false,
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
    enable_moveright = true,
    disable_in_macro = false,
    enable_afterquote = true,
    map_bs = true,
    map_c_w = false,
    disable_in_visualblock = false,
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  }
end

M.setup = function()
  local status_ok, autopairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    return
  end

  autopairs.setup {
    check_ts = nvoid.builtin.autopairs.check_ts,
    enable_check_bracket_line = nvoid.builtin.autopairs.enable_check_bracket_line,
    ts_config = nvoid.builtin.autopairs.ts_config,
    disable_filetype = nvoid.builtin.autopairs.disable_filetype,
    disable_in_macro = nvoid.builtin.autopairs.disable_in_macro,
    ignored_next_char = nvoid.builtin.autopairs.ignored_next_char,
    enable_moveright = nvoid.builtin.autopairs.enable_moveright,
    enable_afterquote = nvoid.builtin.autopairs.enable_afterquote,
    map_c_w = nvoid.builtin.autopairs.map_c_w,
    map_bs = nvoid.builtin.autopairs.map_bs,
    disable_in_visualblock = nvoid.builtin.autopairs.disable_in_visualblock,
    fast_wrap = nvoid.builtin.autopairs.fast_wrap,
  }

  if nvoid.builtin.autopairs.on_config_done then
    nvoid.builtin.autopairs.on_config_done(autopairs)
  end

  pcall(function()
    local function on_confirm_done(...)
      require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
    end
    require("cmp").event:off("confirm_done", on_confirm_done)
    require("cmp").event:on("confirm_done", on_confirm_done)
  end)
end

return M
