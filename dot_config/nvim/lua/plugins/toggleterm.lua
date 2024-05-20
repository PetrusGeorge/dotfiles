return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.3
            end
        end,
        -- shade_terminals = false,
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end,
}
