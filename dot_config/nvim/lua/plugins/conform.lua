return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },

	opts = require("configs.conform"),

	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
