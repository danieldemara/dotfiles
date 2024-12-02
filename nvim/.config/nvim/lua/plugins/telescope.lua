return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "kyazdani42/nvim-web-devicons" },
	},
	config = function()
		local lga_actions = require("telescope-live-grep-args.actions")

		require("telescope").setup({
			defaults = { file_ignore_patterns = { ".git/", "node_modules", ".DS_Store" } },
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				live_grep_args = {
					mappings = {
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "live_grep_args")
	end,
}
