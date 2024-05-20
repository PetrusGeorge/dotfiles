return {
	"williamboman/mason.nvim",

	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },

	opts = function()
		return require("configs.mason")
	end,

	config = function(_, opts)
		require("mason").setup(opts)

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			if opts.ensure_installed and #opts.ensure_installed > 0 then
				vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end
		end, {})

		vim.g.mason_binaries_list = opts.ensure_installed
	end,
}
