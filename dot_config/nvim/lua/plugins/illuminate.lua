return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	opts = require("configs.illuminate"),

	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
