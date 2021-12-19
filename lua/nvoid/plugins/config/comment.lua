local present, commented = pcall(require, "commented")

if not present then
   return
end

commented.setup({
	keybindings = { n = "<leader>/", v = "<leader>/", nl = "<leader>/" },
	comment_padding = " ",
})
