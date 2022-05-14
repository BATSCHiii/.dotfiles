vim.cmd [[augroup ShowLineHints]]
vim.cmd [[  au!]]
vim.cmd [[  autocmd CursorHold,CursorHoldI,CursorMoved *.rs :lua require('lsp_extensions').inlay_hints{}]]
vim.cmd [[augroup END]]
