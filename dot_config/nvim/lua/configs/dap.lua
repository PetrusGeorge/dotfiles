local dap = require("dap")

dap.configurations.cpp = {
	{
		name = "LLDB: Launch with args",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			local argument_string = vim.fn.input("Program arguments: ", "", "file")
			return vim.fn.split(argument_string, " ", true)
		end,
	},
}

dap.configurations.c = vim.deepcopy(dap.configurations.cpp)
