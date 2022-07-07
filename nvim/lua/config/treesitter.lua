local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	ensure_installed = {
		"bash",
		"go",
		"php",
		"phpdoc",
		"java",
		"python",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"scss",
		"vue",
		"yaml",
	},
	highlight = { enable = true },
	autopairs = { enable = true },
	context_commentstring = {
		enable = true,
	},
})
