return {
	"folke/which-key.nvim",
	config = function()
		local whichkey = require("which-key")
		whichkey.setup({})

		-- Normal Mode Bindings
		whichkey.add({
			{ "<leader>d", group = "Debugging" },
			{ "<leader>f", group = "File Management" },
			{ "<leader>g", group = "Git" },
			{ "<leader>m", group = "Markdown" },

			{ "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "" },
			{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Go to previous diagnostic" },
			{
				"[e",
				"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>",
				desc = "Go to previous error",
			},
			{ "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to next diagnostic" },
			{
				"]e",
				"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>",
				desc = "Go to next error",
			},
		})
	end,
}
