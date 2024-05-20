local map = vim.keymap.set
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local float = Terminal:new({
	direction = "float",
	hidden = true,
	float_opts = {
		border = "curved",
	},
})
local vertical = Terminal:new({ direction = "vertical", hidden = true })
local horizontal = Terminal:new({ direction = "horizontal", hidden = true })

map("n", "<leader>gl", function()
	lazygit:toggle()
end, { noremap = true, silent = true, desc = "LazyGit" })

map("n", "<A-/>", function()
	float:toggle()
end, { noremap = true, silent = true })

map("n", "<A-v>", function()
	vertical:toggle()
end, { noremap = true, silent = true })

map("n", "<A-h>", function()
	horizontal:toggle()
end, { noremap = true, silent = true })
