local map = vim.keymap.set

map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })

map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })

map("n", "<leader>tt", "<cmd>TodoTrouble<cr>", { desc = "Todo (Trouble)" })
map("n", "<leader>tT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme (Trouble)" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
map("n", "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme" })
