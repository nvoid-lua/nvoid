local M = {}

M.config = function()
  nvoid.builtin.illuminate = {
    active = true,
    on_config_done = nil,
    options = {
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 120,
      filetype_overrides = {},
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "NvimTree",
        "lazy",
        "neogitstatus",
        "Trouble",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
      },
      filetypes_allowlist = {},
      modes_denylist = {},
      modes_allowlist = {},
      providers_regex_syntax_denylist = {},
      providers_regex_syntax_allowlist = {},
      under_cursor = true,
    },
  }
end

M.setup = function()
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  local config_ok, _ = pcall(illuminate.configure, nvoid.builtin.illuminate.options)
  if not config_ok then
    return
  end
  if nvoid.builtin.illuminate.on_config_done then
    nvoid.builtin.illuminate.on_config_done()
  end
end

return M
