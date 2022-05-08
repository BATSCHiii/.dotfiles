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
 
