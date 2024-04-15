return {
    {
        "stevearc/conform.nvim",
        event = "BufRead",
        config = function()
            require "configs.conform"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            -- dap.listeners.before.event_exited["dapui_config"] = function()
            --   dapui.close()
            -- end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            -- require("core.utils").load_mappings("dap")
            require "configs.dapconfig"
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "nvchad.configs.lspconfig"
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "codelldb",
                "pyright",
                "rust-analyzer",
                "lua-language-server",
                "stylua",
            },
        },
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        -- init = function()
        -- 	vim.g.rustfmt_autosave = 1
        -- end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require "configs.rust-tools"
        end,
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
    {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },
        dependencies = "hrsh7th/nvim-cmp",
        config = function(_, opts)
            local crates = require "crates"
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M = require "nvchad.configs.cmp"
            table.insert(M.sources, { name = "crates" })
            return M
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            return require "configs.treesitter"
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = function()
            return require "configs.nvimtree"
        end,
    },
}
