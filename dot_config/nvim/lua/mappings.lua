require "nvchad.mappings"
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
map("n", "<leader>ec", "<cmd> NvimTreeCollapse <CR>", { desc = "Collapse folders Nvim Tree"})
map("n", "<leader>er", "<cmd> NvimTreeRefresh <CR>", { desc = "Collapse Nvim Tree"})
