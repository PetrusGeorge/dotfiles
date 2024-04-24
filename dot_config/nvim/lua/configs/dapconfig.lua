local dap = require "dap"

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.exepath "codelldb",
        args = { "--port", "${port}" },
    },
}

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

dap.configurations.c = {
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
