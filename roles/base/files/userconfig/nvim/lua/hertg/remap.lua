-- project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- split navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- split create/close
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>wq", "<C-w>q")

-- split rotate
vim.keymap.set("n", "<leader>wr", "<C-w>r")

-- split move and fill
vim.keymap.set("n", "<leader>wH", "<C-w>H")
vim.keymap.set("n", "<leader>wJ", "<C-w>J")
vim.keymap.set("n", "<leader>wK", "<C-w>K")
vim.keymap.set("n", "<leader>wL", "<C-w>L")

-- split resize
vim.keymap.set("n", "<leader>Wh", "<C-w>5<")
vim.keymap.set("n", "<leader>Wj", "<C-w>5-")
vim.keymap.set("n", "<leader>Wk", "<C-w>5+")
vim.keymap.set("n", "<leader>Wl", "<C-w>5>")

-- split terminal
vim.keymap.set("n", "<leader>wt", ":terminal<CR>:resize 12<CR>:set winfixheight<CR>")

-- ranger
-- vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>")

-- search
vim.keymap.set("n", "<leader>s", "/")

-- shortcuts
vim.keymap.set("n", "<leader>qq", ":q<CR>")
vim.keymap.set("n", "<leader>qa", ":qa<CR>")
vim.keymap.set("n", "<leader>qwa", ":qwa<CR>")
vim.keymap.set("n", "<leader>qw", ":wq<CR>")
vim.keymap.set("n", "<leader>ww", ":w<CR>")
vim.keymap.set("n", "<leader>wa", ":wa<CR>")

-- make ctrl-d and ctrl-u center the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- copy to system clipboard with <leader>y
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- close terminal with Esc

