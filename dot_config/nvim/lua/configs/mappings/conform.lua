local map = vim.keymap.set

map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format file" })
