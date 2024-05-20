return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = true,
}
