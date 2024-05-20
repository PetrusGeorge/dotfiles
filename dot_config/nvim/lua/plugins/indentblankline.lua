return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = { "echasnovski/mini.indentscope" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
	},
	main = "ibl",
}
