return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		cmd = { "DapToggleBreakpoint", "DapContinue" },
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
		config = function(_, opts)
			require("mason-nvim-dap").setup(opts)
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("configs.dap")
		end,
	},
}
