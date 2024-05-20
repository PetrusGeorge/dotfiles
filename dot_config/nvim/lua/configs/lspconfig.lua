local M = {}

local icons = require("icons")
local opts = {
	diagnostics = {
		underline = true,
		update_in_insert = false,
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = "icons",
		},
		severity_sort = true,

		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
				[vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
				[vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
				[vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
			},
		},
	},
}

if vim.fn.has("nvim-0.10.0") == 0 then
	for severity, icon in pairs(opts.diagnostics.signs.text) do
		local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
end

if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
	opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
		or function(diagnostic)
			for d, icon in pairs(icons.diagnostics) do
				if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
					return icon
				end
			end
		end
end
vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
	local function conf(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "<leader>ld", vim.lsp.buf.declaration, conf("Go to declaration"))
	map("n", "<leader>lD", vim.lsp.buf.type_definition, conf("Go to type definition"))
	map("n", "K", vim.lsp.buf.hover, conf("hover information"))
	map("n", "<leader>li", vim.lsp.buf.implementation, conf("Go to implementation"))
	map("n", "<leader>ls", vim.lsp.buf.signature_help, conf("Show signature help"))
	map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, conf("Add workspace folder"))
	map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, conf("Remove workspace folder"))

	map("n", "<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, conf("List workspace folders"))

	map("n", "<leader>lr", function()
		vim.lsp.buf.rename()
	end, conf("Renamer"))

	map({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, conf("Code action"))
	map("n", "<leader>lR", vim.lsp.buf.references, conf("Show references"))
end

-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

return M
