local on_attach = require("configs.lspconfig").on_attach
local on_init = require("configs.lspconfig").on_init
local capabilities = require("configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

local servers = {
	clangd = {},
	pyright = {},

	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
				runtime = {
					version = "LuaJIT",
				},
			},
		},
	},

	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
			},
		},
	},
}

for name, opts in pairs(servers) do
	opts.on_init = on_init
	opts.on_attach = on_attach
	opts.capabilities = capabilities

	lspconfig[name].setup(opts)
end
