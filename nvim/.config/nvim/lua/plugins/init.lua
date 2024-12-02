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
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		keys = {
			{ "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "[F]ile [T]ree Toggle", silent = true },
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

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
		ft = "typescript",
		init = function()
			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = "typescript",
	},

	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "[M]arkdown [P]review" },
		},
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"towolf/vim-helm",
		ft = "helm",
	},

	{ "christoomey/vim-tmux-navigator" },

	{
		"ruifm/gitlinker.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
	},

	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		config = function()
			require("copilot_cmp").setup()
		end,
		dependencies = {
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			config = function()
				require("copilot").setup({
					suggestion = { enabled = false },
					panel = { enabled = false },
				})
			end,
		},
	},
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
}
