local present1, autopairs = pcall(require, "nvim-autopairs")
local present2 = pcall(require, "cmp")
if not (present1 and present2) then
  return
end
local options = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
}
autopairs.setup(options)
