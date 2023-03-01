local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<F3>", ui.toggle_quick_menu)
vim.keymap.set("n", "<F4>", mark.add_file)

vim.keymap.set("n", "<F5>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<F6>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<F7>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<F8>", function() ui.nav_file(4) end)
