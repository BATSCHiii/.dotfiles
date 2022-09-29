require("plugins")
require("keybinds")
require("options")
require("lsp")
require("telescope_config")
require("treesitter")

vim.cmd("highlight Normal guibg=NONE")
vim.cmd("highlight LineNr guifg=#5eacd3")
vim.cmd("autocmd BufRead,BufNewFile   *.tex setlocal tabstop=2")
vim.cmd("autocmd BufRead,BufNewFile   *.tex setlocal shiftwidth=2")

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]
