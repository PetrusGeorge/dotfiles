local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        asm = { "asmfmt" },
    },

    -- format_on_save = {
    -- 	timeout_ms = 500,
    -- 	lsp_fallback = true,
    -- },
}

require("conform").setup(options)
