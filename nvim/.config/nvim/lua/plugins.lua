local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

return require("packer").startup(function()
	use 'ellisonleao/gruvbox.nvim'

	use 'folke/tokyonight.nvim'

	use { "catppuccin/nvim", as = "catppuccin" }

	use({
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"mbbill/undotree",
		"ThePrimeagen/harpoon",
        "wbthomason/packer.nvim",
--		"nvim-lua/lsp_extensions.nvim",
		'simrat39/rust-tools.nvim',
	})

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use {'rstacruz/vim-closer'}
	
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
