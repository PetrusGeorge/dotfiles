return {
	"echasnovski/mini.indentscope",
	opts = {
		symbol = "│",
		options = { try_as_border = true },
		draw = {
			animation = require("mini.indentscope").gen_animation.linear({ duration = 100, unit = "total" }),
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"dashboard",
				"NvimTree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
