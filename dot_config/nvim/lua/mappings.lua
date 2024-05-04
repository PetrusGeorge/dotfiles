require("nvchad.mappings")
local map = vim.keymap.set
local del = vim.keymap.del

-- General
map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })
map("n", "<leader>q", "<cmd> q! <CR>", { desc = "Quit window" })
map("n", "<leader>ka", "<cmd> qall! <CR>", { desc = "Quit neovim" })

-- Tab
map("n", "<leader>tn", "<cmd> tabnew <CR>", { desc = "Create new tab" })
map("n", "<leader>tc", "<cmd> tabclose <CR>", { desc = "Close current tab" })
map("n", "<leader><tab>", "<cmd> tabnext <CR>", { desc = "Go to next tab" })
map("n", "<leader>p<tab>", "<cmd> tabprevious <CR>", { desc = "Go to previous tab" })

-- Dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue debugger" })
map("n", "<leader>dt", function()
	require("dapui").toggle()
end, { desc = "Toggle dapui" })
map("n", "<leader>dc", function()
	require("dapui").close()
end, { desc = "Close dapui" })

-- Rust
map("n", "<leader>ds", "<cmd> RustDebuggable <CR>", { desc = "Run debugger for rust" })
map("n", "<leader>rcu", function()
	require("crates").upgrade_all_crates()
end, { desc = "Update crates" })

-- Nvim Tree
del("n", "<leader>e")
map("n", "<leader>ec", "<cmd> NvimTreeCollapse <CR>", { desc = "Collapse folders Nvim Tree" })
map("n", "<leader>er", "<cmd> NvimTreeRefresh <CR>", { desc = "Collapse Nvim Tree" })

-- Tmux Navigator
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

map("n", "<C-h>", function()
	local border = vim.fn.system([[tmux display-message -p '#{pane_at_left}']])
	border = tonumber(border)
	if border == 0 then
		vim.cmd("TmuxNavigateLeft")
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>h", true, true, true), "n", true)
	end
end, { desc = "Tmux navigator left" })

map("n", "<C-j>", function()
	local border = vim.fn.system([[tmux display-message -p '#{pane_at_bottom}']])
	border = tonumber(border)
	if border == 0 then
		vim.cmd("TmuxNavigateDown")
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>j", true, true, true), "n", true)
	end
end, { desc = "Tmux navigator down" })

map("n", "<C-k>", function()
	local border = vim.fn.system([[tmux display-message -p '#{pane_at_top}']])
	border = tonumber(border)
	if border == 0 then
		vim.cmd("TmuxNavigateUp")
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>k", true, true, true), "n", true)
	end
end, { desc = "Tmux navigator up" })

map("n", "<C-l>", function()
	local border = vim.fn.system([[tmux display-message -p '#{pane_at_right}']])
	border = tonumber(border)
	if border == 0 then
		vim.cmd("TmuxNavigateRight")
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l", true, true, true), "n", true)
	end
end, { desc = "Tmux navigator right" })

map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")
