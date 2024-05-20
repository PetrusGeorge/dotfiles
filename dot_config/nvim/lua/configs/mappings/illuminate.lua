local map = vim.keymap.set

map("n", "[[", function()
	require("illuminate").goto_prev_reference(false)
end, { desc = "Previous Reference" })

map("n", "]]", function()
	require("illuminate").goto_next_reference(false)
end, { desc = "Next Reference" })
