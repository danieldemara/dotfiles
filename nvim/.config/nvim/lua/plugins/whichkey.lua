return {
	"folke/which-key.nvim",
	config = function()
		local whichkey = require("which-key")
		whichkey.setup({})

		-- Insert Mode Bindings
		-- whichkey.add({
		-- 	{ "jk", ""<Esc>", desc = "Exit Insert Mode" },
		-- }, { mode = "i" })

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
			{ "<leader>fF", "<cmd>Telescope find_files no_ignore=true<cr>", desc = "[F]ind [F]ile (All)" },
			{
				"<leader>fI",
				":lua require('telescope').extensions.live_grep_args.live_grep_args({vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--no-ignore', '--hidden' }})<cr>",
				desc = "[F]ind [I]n Files (All)",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [B]uffers" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]ile" },
			{
				"<leader>fi",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				desc = "[F]ind [I]n Files",
			},
			{ "<leader>fn", "<cmd>vnew<cr>", desc = "[F]ile [N]ew" },
			{ "<leader>fp", "<cmd>Telescope projects<cr>", desc = "[F]ind [P]rojects" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "[F]ind [R]ecent Files" },
			{ "<leader>ft", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle [F]ile [T]ree" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "[G]it [R]eset Buffer" },
			{ "<leader>gS", "<cmd>lua require('gitsigns').stage_buffer()<cr>", desc = "[G]it [S]tage Buffer" },
			{ "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "[G]it [B]lame" },
			{ "<leader>gd", "<cmd>lua require('gitsigns').diffthis()<cr>", desc = "[G]it [D]iff" },
			{ "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "[G]it [P]review Hunk" },
			{ "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "[G]it [R]eset Hunk" },
			{ "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "[G]it [S]tage Hunk" },
			{ "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "[G]it [U]ndo Stage Hunk" },

			{ "<leader>m", group = "Markdown" },
			{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "[M]arkdown [P]review" },

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
