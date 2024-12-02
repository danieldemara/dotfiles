return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local lga_actions = require("telescope-live-grep-args.actions")

		require("telescope").setup({
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
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "live_grep_args")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fF", function()
			builtin.find_files({ no_ignore = true })
		end, { desc = "[F]ind [F]ile (All)" })
		vim.keymap.set("n", "<leader>fi", extensions.live_grep_args.live_grep_args, { desc = "[F]ind [I]n Files" })
		vim.keymap.set("n", "<leader>fI", function()
			extensions.live_grep_args.live_grep_args({
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--no-ignore",
					"--hidden",
				},
			})
		end, { desc = "[F]ind [I]n Files (All)" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecent Files" })
		vim.keymap.set("n", "<leader>fc", builtin.resume, { desc = "[F]ind [C]ontinue" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fn", "<cmd>vnew<cr>", { desc = "[F]ile [N]ew" })
	end,
}
