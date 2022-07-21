local whichkey = require("which-key")

whichkey.setup({})

-- Insert Mode Bindings
whichkey.register({
	jk = { "<Esc>", "Exit Insert Mode" },
}, { mode = "i" })

-- Normal Mode Bindings
whichkey.register({
	["<leader>f"] = {
		name = "File Management",
		f = { "<cmd>Telescope find_files<cr>", "[F]ind [F]ile" },
		r = { "<cmd>Telescope oldfiles<cr>", "[F]ind [R]ecent Files" },
		i = { "<cmd>Telescope live_grep<cr>", "[F]ind [I]n Files" },
		b = { "<cmd>Telescope buffers<cr>", "[F]ind [B]uffers" },
		p = { "<cmd>Telescope projects<cr>", "[F]ind [P]rojects" },
		t = { "<cmd>NvimTreeToggle<cr>", "[F]ind [P]rojects" },
		n = { "New File" },
	},
	["<leader>d"] = {
		name = "Debugging",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "[D]ebug [B]reakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "[D]ebug [C]ontiue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "[D]ebug Step [I]nto" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "[D]ebug Step [O]ver" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "[D]ebug Step [O]ut" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "[D]ebug [R]EPL" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "[D]ebug [R]un" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "[D]ebug [U]I" },
		t = { "<cmd>lua require'dap'.terminate()<cr>", "[D]ebug [T]erminate" },
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
