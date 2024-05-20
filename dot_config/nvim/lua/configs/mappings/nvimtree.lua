local map = vim.keymap.set

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Collapse folders Nvim Tree" })
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse folders Nvim Tree" })
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Collapse Nvim Tree" })
