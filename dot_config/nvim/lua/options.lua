local opt = vim.opt
local o = vim.o
local g = vim.g

--Colorscheme
vim.cmd("colorscheme tokyonight")

o.laststatus = 3
o.showmode = false

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

if not vim.env.SSH_TTY then -- only set clipboard if not in ssh
	opt.clipboard = "unnamedplus"
end
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
opt.nu = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
-- opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- opt.whichwrap:append("<>[]hl")

-- disable some default providers
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
