local map = vim.keymap.set

map("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", { desc = "Document Diagnostics (Trouble)" })
map("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace Diagnostics (Trouble)" })
map("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Quickfix List (Trouble)" })

map("n", "[q", function()
	if require("trouble").is_open() then
		require("trouble").previous({ skip_groups = true, jump = true })
	else
		local ok, err = pcall(vim.cmd.cprev)
		if not ok then
			vim.notify(err, vim.log.levels.ERROR)
		end
	end
end, { desc = "Previous Trouble/Quickfix Item" })

map("n", "]q", function()
	if require("trouble").is_open() then
		require("trouble").next({ skip_groups = true, jump = true })
	else
		local ok, err = pcall(vim.cmd.cnext)
		if not ok then
			vim.notify(err, vim.log.levels.ERROR)
		end
	end
end, { desc = "Next Trouble/Quickfix Item" })
