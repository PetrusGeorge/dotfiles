local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

lspconfig.clangd.setup {
    -- on_attach = function (client, bufnr)
    --     client.server_capabilities.signatureHelpProvider = false
    --     on_attach(client, bufnr)
    -- end,
    on_attach = on_attach,
    filetypes = { "c", "cpp" },
    capabilities = capabilities,
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
}

-- lspconfig.rust_analyzer.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = {"rust"},
--     settings = {
--         ['rust_analyzer'] = {
--             cargo = {
--                 allFeatures = true,
--             },
--         },
--     },
-- }
