local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
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
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "live_grep_args")
