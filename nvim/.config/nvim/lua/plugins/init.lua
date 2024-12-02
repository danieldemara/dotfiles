return {
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

	-- File Tree
	{ "kyazdani42/nvim-tree.lua", opts = {} },

	-- Git Gutter
	{ "lewis6991/gitsigns.nvim",  opts = {} },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "┊",
				-- show_trailing_blankline_indent = false,
			},
			scope = { enabled = false },
		},
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		init = function()
			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
	{ "windwp/nvim-ts-autotag" },

	{ "mfussenegger/nvim-jdtls" },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{ "towolf/vim-helm" },

	{ "christoomey/vim-tmux-navigator" },

	{
		"ruifm/gitlinker.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
	},

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		dependencies = {
			"zbirenbaum/copilot-cmp",
		},
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},

	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
}
