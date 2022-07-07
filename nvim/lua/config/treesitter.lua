local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
	ensure_installed = { "go", "php", "phpdoc", "java", "python", "lua" },
	highlight = { enable = true },
	autopairs = { enable = true },
})
