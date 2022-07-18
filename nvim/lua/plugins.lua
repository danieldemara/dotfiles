-- Autoconfigure packer as a package manager
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	-- Package manager
	use({ "wbthomason/packer.nvim" })

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config.telescope")
		end,
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- Better Syntax Highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	})

	-- Language Server Configs
	use({ "neovim/nvim-lspconfig" })
	use({
		"williamboman/nvim-lsp-installer",
		requires = { "neovim/nvim-lspconfig" },
	})

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			require("config.cmp")
		end,
	})

	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })

	-- Colorscheme
	use({ "folke/tokyonight.nvim" })

	-- Highlight Current Word
	use({ "RRethy/vim-illuminate" })

	-- Status Bar
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine")
		end,
	})
	use({ "kyazdani42/nvim-web-devicons" })

	-- File Tree
	use({ "kyazdani42/nvim-tree.lua" })

	-- Linter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config.null-ls")
		end,
	})

	-- Git Gutter
	use({ "lewis6991/gitsigns.nvim" })

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("config.comment")
		end,
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "windwp/nvim-ts-autotag" })

	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("config.dashboard")
		end,
	})

	use({ "mfussenegger/nvim-dap" })
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("config.dap")
		end,
	})

	use({ "mfussenegger/nvim-jdtls" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
