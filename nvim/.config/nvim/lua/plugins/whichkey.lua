return {
	"folke/which-key.nvim",
	config = function()
		local whichkey = require("which-key")
		whichkey.setup({})

		-- Normal Mode Bindings
		whichkey.add({
			{ "<leader>d", group = "Debugging" },
			{
				"<leader>dB",
				"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				desc = "[D]ebug Conditional [B]reakpoint",
			},
			{ "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "[D]ebug Step [O]ut" },
			{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "[D]ebug [B]reakpoint" },
			{ "<leader>dd", "<cmd>lua require'dap'.continue()<cr>", desc = "[D]ebug Start/Continue" },
			{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "[D]ebug Step [I]nto" },
			{ "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "[D]ebug [R]un" },
			{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "[D]ebug Step [O]ver" },
			{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "[D]ebug [R]EPL" },
			{ "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "[D]ebug [T]erminate" },
			{ "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "[D]ebug [U]I" },

			{ "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "" },

			{ "<leader>f", group = "File Management" },
			{ "<leader>g", group = "Git" },
			{ "<leader>m", group = "Markdown" },

			{ "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "" },
			{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Go to previous any" },
			{
				"[e",
				"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>",
				desc = "Go to previous error",
			},
			{ "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Go to next any" },
			{
				"]e",
				"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>",
				desc = "Go to next error",
			},
		})
	end,
}
