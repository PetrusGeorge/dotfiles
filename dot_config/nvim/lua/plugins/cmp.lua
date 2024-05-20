return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			"windwp/nvim-autopairs",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			{
				"saecki/crates.nvim",
				ft = { "rust", "toml" },
				config = function(_, opts)
					local crates = require("crates")
					crates.setup(opts)
					crates.show()
				end,
			},
		},
	},

	opts = function()
		return require("configs.cmp")
	end,
	config = function(_, opts)
		require("cmp").setup(opts)
	end,
}
