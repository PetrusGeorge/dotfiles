return {
	"christoomey/vim-tmux-navigator",

	keys = { "<C-h>", "<C-j>", "<C-k>", "<C-l>" },
	config = function()
		local map = vim.keymap.set

		map("n", "<C-h>", function()
			local border = tonumber(vim.fn.system([[tmux display-message -p '#{pane_at_left}']]))
			if border == 0 then
				vim.cmd("TmuxNavigateLeft")
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>h", true, true, true), "n", true)
			end
		end, { desc = "Tmux navigator left" })

		map("n", "<C-j>", function()
			local border = tonumber(vim.fn.system([[tmux display-message -p '#{pane_at_bottom}']]))
			if border == 0 then
				vim.cmd("TmuxNavigateDown")
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>j", true, true, true), "n", true)
			end
		end, { desc = "Tmux navigator down" })

		map("n", "<C-k>", function()
			local border = tonumber(vim.fn.system([[tmux display-message -p '#{pane_at_top}']]))
			if border == 0 then
				vim.cmd("TmuxNavigateUp")
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>k", true, true, true), "n", true)
			end
		end, { desc = "Tmux navigator up" })

		map("n", "<C-l>", function()
			local border = tonumber(vim.fn.system([[tmux display-message -p '#{pane_at_right}']]))
			if border == 0 then
				vim.cmd("TmuxNavigateRight")
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l", true, true, true), "n", true)
			end
		end, { desc = "Tmux navigator right" })

		-- map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")
	end,
}
