-- Declare commonly used variables.
local packer = require("packer")

packer.startup({
	function(use)
		-- Plugin manager.
		use("wbthomason/packer.nvim")

		-- LSP.
		use({
			"neovim/nvim-lspconfig",
			config = [[require('lua-configs.lspconfig')]],
		})

		-- Completion.
		use({
			"hrsh7th/nvim-cmp",
			config = [[require('lua-configs.cmp')]],
		})

		-- Sources for completion.
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")

		-- Formatter, Code Actions, Diagnostics, etc.
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = [[require('lua-configs.null-ls')]],
		})

		-- Auto close brakets, etc.
		use({
			"windwp/nvim-autopairs",
			config = [[require('lua-configs.autopairs')]],
		})

		-- Auto close HTML, etc.
		use({
			"windwp/nvim-ts-autotag",
			config = [[require('lua-configs.autotag')]],
		})

		-- Colorscheme.
		use({
			"sainnhe/gruvbox-material",
			config = [[require('lua-configs.gruvbox-material')]],
		})

		-- Statusline.
		use({
			"nvim-lualine/lualine.nvim",
			config = [[require('lua-configs.lualine')]],
		})

		-- Treesitter.
		use({
			"nvim-treesitter/nvim-treesitter",
			config = [[require('lua-configs.treesitter')]],
		})

		-- Indentation markers.
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = [[require('lua-configs.indent-blankline')]],
		})

		-- Fuzzy finder.
		use({
			"ibhagwan/fzf-lua",
			config = [[require('lua-configs.fzf')]],
		})

		-- Comment lines.
		use({
			"numToStr/Comment.nvim",
			config = [[require('lua-configs.comment')]],
		})

		-- File manager.
		use({
			"kyazdani42/nvim-tree.lua",
			config = [[require('lua-configs.tree')]],
		})

		-- Git status, etc.
		use({
			"lewis6991/gitsigns.nvim",
			config = [[require('lua-configs.gitsigns')]],
		})

		-- Persistent terminal.
		use({
			"akinsho/toggleterm.nvim",
			tag = "v1.*",
			config = [[require('lua-configs.toggleterm')]],
		})
	end,
	config = {
		-- Packer display configurations when running PackerSync, etc.
		display = {
			working_sym = ">",
			error_sym = "-",
			done_sym = "+",
			removed_sym = "-",
			moved_sym = "+",
			header_sym = "",
		},
	},
})
