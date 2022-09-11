-- Setup nvim-cmp
local cmp = require("cmp")

-- completion setup
cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },
    sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
    },
	formatting = {
		format = function(entry, vim_item)
		  vim_item.menu = ({
			nvim_lsp = "[LSP]",
			luasnip = "[Snippet]",
			buffer = "[Buffer]",
			path = "[Path]",
		  })[entry.source.name]
		  return vim_item
		end,
  },
})

-- helper function for mappings
local m = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd> " .. result .. "<cr>", {
        noremap = true,
        silent = true,
    })
end

-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
    -- Mappings.
    m("n", "ga", "lua vim.lsp.buf.code_action()")
    m("n", "gD", "lua vim.lsp.buf.declaration()")
    m("n", "gd", "lua vim.lsp.buf.definition()")
    m("n", "ge", "lua vim.lsp.diagnostic.goto_next()")
    m("n", "gE", "lua vim.lsp.diagnostic.goto_prev()")
    m("n", "gi", "lua vim.lsp.buf.implementation()")
    m("n", "gr", "lua vim.lsp.buf.references()")
    m("n", "K", "lua vim.lsp.buf.hover()")
    -- m("n", "<space>rn", "lua vim.lsp.buf.rename()")
    m("n", "gl", "lua vim.diagnostic.open_float()")
    --m("n", "<space>f", "lua vim.lsp.buf.formatting()")
end

require('rust-tools').setup({
	server = {
		on_attach = on_attach,	
	},
	tools = { -- rust-tools options

		inlay_hints = {
		  -- automatically set inlay hints (type hints)
		  -- default: true
		  auto = true,

		  -- Only show inlay hints for the current line
		  only_current_line = false,

		  -- whether to show parameter hints with the inlay hints or not
		  -- default: true
		  show_parameter_hints = true,

		  -- prefix for parameter hints
		  -- default: "<-"
		  parameter_hints_prefix = "<- ",

		  -- prefix for all the other hints (type, chaining)
		  -- default: "=>"
		  other_hints_prefix = "  >> ",

		  -- whether to align to the length of the longest line in the file
		  max_len_align = false,

		  -- padding from the left if max_len_align is true
		  max_len_align_padding = 1,

		  -- whether to align to the extreme right or not
		  right_align = false,

		  -- padding from the right if right_align is true
		  right_align_padding = 7,

		  -- The color of the hints
		  highlight = "Comment",
		},
	},
})

require('lspconfig').rust_analyzer.setup {
	on_attach = on_attach,
--	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}

require('lspconfig').ccls.setup{
	on_attach = on_attach,
}
