-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- number of spaces to use to display tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
-- number of spaces to use for indents
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- don't wrap long lines
vim.opt.wrap = false
-- don't automatically resize windows to equal widths
vim.opt.equalalways = false

-- do not create backups / swapfile
vim.opt.swapfile = false
vim.opt.backup = false
-- enable undotree to undo far back
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- ignore case when searching
vim.opt.ignorecase = true
-- no automatic ignore-case switch
vim.opt.smartcase = true
-- highlight search results
vim.opt.hlsearch = false
-- highlight as you type
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- always show min 8 lines above/below
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- show column at right edge
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

