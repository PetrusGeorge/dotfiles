local map = vim.keymap.set

require("configs.mappings")

map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
-- map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
-- map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })

map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })
map("n", "<leader>q", "<cmd> q! <CR>", { desc = "Quit window" })
map("n", "<leader>ka", "<cmd> qall! <CR>", { desc = "Quit neovim" })

-- -- global lsp mappings
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "lsp floating diagnostics" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "lsp prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "lsp next diagnostic" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- terminal
map("t", "<ESC>", [[<C-\><C-n>]], { desc = "terminal escape terminal mode" })

-- Crates
map("n", "<leader>rcu", function()
	require("crates").upgrade_all_crates()
end, { desc = "Update crates" })
