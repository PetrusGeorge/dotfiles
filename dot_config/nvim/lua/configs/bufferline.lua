return {

	options = {

		close_command = function(n)
			require("mini.bufremove").delete(n, false)
		end,
		right_mouse_command = function(n)
			require("mini.bufremove").delete(n, false)
		end,
		diagnostics = "nvim_lsp",
		always_show_bufferline = true,
		diagnostics_indicator = function(_, _, diag)
			local icons = require("icons").diagnostics
			local ret = (diag.error and icons.Error .. diag.error .. " " or "")
				.. (diag.warning and icons.Warn .. diag.warning or "")
			return vim.trim(ret)
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "NvimTree",
				text_align = "center",
				separator = true,
			},
		},
	},
}
