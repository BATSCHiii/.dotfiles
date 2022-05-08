function map(mode, lhs, rhs, opts)
        local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "jk", "<Esc>")
map("v", "<C-c>", "\"+y")
map("i", "<C-v>", "<Esc>\"+pa")
map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", "<C-u>", ":UndotreeToggle<CR>")
map("n", "<F3>", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
map("n", "<F4>", ":lua require(\"harpoon.mark\").add_file()<CR>")
map("n", "<F5>", ":lua require(\"harpoon.ui\").nav_file(1)<CR>")
map("n", "<F6>", ":lua require(\"harpoon.ui\").nav_file(2)<CR>")
map("n", "<F7>", ":lua require(\"harpoon.ui\").nav_file(3)<CR>")
map("n", "<F8>", ":lua require(\"harpoon.ui\").nav_file(4)<CR>")
