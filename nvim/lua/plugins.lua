-- Autoconfigure packer as a package manager
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local PACKER_BOOTSTRAP = ensure_packer()

require("packer").startup(function(use)
	-- Package manager
	use({ "wbthomason/packer.nvim" })

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
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
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })

	-- Language Server Configs
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })

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
		"nvimtools/none-ls.nvim",
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
		"lukas-reineke/indent-blankline.nvim",
	})

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
		"folke/which-key.nvim",
		config = function()
			require("config.whichkey")
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
	use({ "leoluz/nvim-dap-go" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	use({ "mfussenegger/nvim-jdtls" })

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use({ "towolf/vim-helm" })

	use({ "christoomey/vim-tmux-navigator" })

	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
