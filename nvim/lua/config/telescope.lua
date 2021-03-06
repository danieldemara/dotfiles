local telescope = require("telescope")

telescope.setup({
	defaults = { file_ignore_patterns = { ".git/", "node_modules" } },
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

telescope.load_extension("fzf")
