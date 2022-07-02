local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
  ensure_installed = { "go", "php", "phpdoc" },
  highlight = { enable = true },
})
