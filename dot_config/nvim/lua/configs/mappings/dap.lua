local map = vim.keymap.set

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue debugger" })

map("n", "<leader>dt", function()
	require("dapui").toggle()
end, { desc = "Toggle dapui" })

map("n", "<leader>dc", function()
	require("dapui").close()
end, { desc = "Close dapui" })
