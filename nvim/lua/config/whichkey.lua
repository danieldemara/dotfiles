local whichkey = require("which-key")

whichkey.setup({})

-- Insert Mode Bindings
-- whichkey.register({
-- 	jk = { "<Esc>", "Exit Insert Mode" },
-- }, { mode = "i" })

-- Normal Mode Bindings
whichkey.register({
	["<leader>f"] = {
		name = "File Management",
		f = { "<cmd>Telescope find_files<cr>", "[F]ind [F]ile" },
		F = { "<cmd>Telescope find_files no_ignore=true<cr>", "[F]ind [F]ile (All)" },
		r = { "<cmd>Telescope oldfiles<cr>", "[F]ind [R]ecent Files" },
		i = {
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
			"[F]ind [I]n Files",
		},
		I = {
			":lua require('telescope').extensions.live_grep_args.live_grep_args({vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--no-ignore', '--hidden' }})<cr>",
			"[F]ind [I]n Files (All)",
		},
		b = { "<cmd>Telescope buffers<cr>", "[F]ind [B]uffers" },
		p = { "<cmd>Telescope projects<cr>", "[F]ind [P]rojects" },
		t = { "<cmd>NvimTreeFindFileToggle<cr>", "Toggle [F]ile [T]ree" },
		n = { "<cmd>vnew<cr>", "[F]ile [N]ew" },
	},
	["<leader>g"] = {
		name = "Git",
		b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "[G]it [B]lame" },
		p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "[G]it [P]review Hunk" },
		s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "[G]it [S]tage Hunk" },
		u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "[G]it [U]ndo Stage Hunk" },
		r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "[G]it [R]eset Hunk" },
		d = { "<cmd>lua require('gitsigns').diffthis()<cr>", "[G]it [D]iff" },
		S = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "[G]it [S]tage Buffer" },
		R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "[G]it [R]eset Buffer" },
	},
	["<leader>d"] = {
		name = "Debugging",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "[D]ebug [B]reakpoint" },
		B = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			"[D]ebug Conditional [B]reakpoint",
		},
		d = { "<cmd>lua require'dap'.continue()<cr>", "[D]ebug Start/Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "[D]ebug Step [I]nto" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "[D]ebug Step [O]ver" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "[D]ebug Step [O]ut" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "[D]ebug [R]EPL" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "[D]ebug [R]un" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "[D]ebug [U]I" },
		t = { "<cmd>lua require'dap'.terminate()<cr>", "[D]ebug [T]erminate" },
	},
	["<leader>m"] = {
		name = "Markdown",
		p = { "<cmd>MarkdownPreviewToggle<cr>", "[M]arkdown [P]review" },
	},
	["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "" },
	["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to previous any" },
	["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next any" },
	["[e"] = {
		"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<cr>",
		"Go to previous error",
	},
	["]e"] = {
		"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<cr>",
		"Go to next error",
	},
	["<leader>q"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "" },
})
