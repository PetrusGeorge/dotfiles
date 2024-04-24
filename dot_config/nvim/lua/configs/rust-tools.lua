local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilites = require("nvchad.configs.lspconfig").capabilities

local install_root_dir = vim.fn.stdpath "data" .. "/mason"
local extension_path = install_root_dir .. "/packages/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local options = {
    server = {
        on_attach = on_attach,
        capabilites = capabilites,
        settings = {
            ["rust-analyzer"] = {
                check= {
                    command = "clippy"
                }
            }
        }
    },
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
}

return options
