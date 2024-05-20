return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = function()
		require("configs.lspsetup")
	end,
}
