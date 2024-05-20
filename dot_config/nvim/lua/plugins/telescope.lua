return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	cmd = "Telescope",
	opts = function()
		return require("configs.telescope")
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		-- load extensions
		if opts.extensions_list then
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end
	end,
}
