local map = vim.keymap.set

map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer goto next" })

map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer goto prev" })

map("n", "<leader>x", function()
	require("mini.bufremove").delete(0, true)
end, { desc = "Buffer close" })
