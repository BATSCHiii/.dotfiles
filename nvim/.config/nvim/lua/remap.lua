vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("v", "<C-c>", "\"+y")
vim.keymap.set("i", "<C-v>", "<Esc>\"+pa")
