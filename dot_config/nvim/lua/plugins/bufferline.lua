return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.bufremove" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	opts = require("configs.bufferline"),
	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
