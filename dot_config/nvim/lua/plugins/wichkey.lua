return {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = {
        plugins = { spelling = true },
        defaults = {
            mode = { "n", "v" },
            ["<leader>d"] = { name = "Dap" },
            ["<leader>t"] = { name = "ToDo/Trouble" },
            ["<leader>l"] = { name = "LSP" },
            ["<leader>lw"] = { name = "Workspace" },
            ["<leader>e"] = { name = "NvimTree" },
            ["<leader>f"] = { name = "Telescope" },
            ["<leader>g"] = { name = "Git" },
            ["<leader>k"] = { name = "Kill" },
        },
    },
    config = function(_, opts)
        require("which-key").setup(opts)
        require("which-key").register(opts.defaults)
    end,
}
