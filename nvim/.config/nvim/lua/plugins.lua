-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Colorscheme
		{
			"folke/tokyonight.nvim",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
			init = function()
				vim.api.nvim_command([[colorscheme tokyonight]])
				vim.cmd.hi("Comment gui=none")
			end,
		},

		-- Fuzzy Finder
		{
			"nvim-telescope/telescope.nvim",
			event = "VimEnter",
			branch = "0.1.x",
			dependencies = {
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
					cond = function()
						return vim.fn.executable("make") == 1
					end,
				},
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
			},
			config = function()
				require("config.telescope")
			end,
		},

		-- Better Syntax Highlighting
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("config.treesitter")
			end,
		},
		{ "nvim-treesitter/nvim-treesitter-textobjects" },

		-- Language Server Configs
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocomplete
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
			},
			config = function()
				require("config.cmp")
			end,
		},

		-- Snippets
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },

		-- Highlight Current Word
		{ "RRethy/vim-illuminate" },

		-- Status Bar
		{
			"nvim-lualine/lualine.nvim",
			config = function()
				require("config.lualine")
			end,
		},
		{ "kyazdani42/nvim-web-devicons" },

		-- File Tree
		{ "kyazdani42/nvim-tree.lua" },

		-- Linter
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			config = function()
				require("config.null-ls")
			end,
		},

		-- Git Gutter
		{ "lewis6991/gitsigns.nvim" },

		{
			"lukas-reineke/indent-blankline.nvim",
		},

		{
			"windwp/nvim-autopairs",
			config = function()
				require("config.autopairs")
			end,
		},

		{
			"numToStr/Comment.nvim",
			config = function()
				require("config.comment")
			end,
		},
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "windwp/nvim-ts-autotag" },

		{
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey")
			end,
		},

		{ "mfussenegger/nvim-dap" },
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
			config = function()
				require("config.dap")
			end,
		},
		{ "leoluz/nvim-dap-go" },
		{ "theHamsta/nvim-dap-virtual-text" },

		{ "mfussenegger/nvim-jdtls" },

		{
			"iamcco/markdown-preview.nvim",
			build = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		},

		{ "towolf/vim-helm" },

		{ "christoomey/vim-tmux-navigator" },

		{
			"ruifm/gitlinker.nvim",
			dependencies = "nvim-lua/plenary.nvim",
		},

		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			dependencies = {
				{
					"zbirenbaum/copilot-cmp",
					config = function()
						require("copilot_cmp").setup()
					end,
				},
			},
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "tokyonight" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
