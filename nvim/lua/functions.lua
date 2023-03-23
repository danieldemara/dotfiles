local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.lsp_on_attach(client, bufnr)
	-- Disable Built-in LSP formatting in favor of null-ls
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	-- Add intelligent highlighting
	require("illuminate").on_attach(client)

	-- Java LSP Special Config
	if client.name == "jdt.ls" then
		-- vim.lsp.codelens.refresh()

		-- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
		-- you make during a debug session immediately.
		-- Remove the option if you do not want that.
		require("jdtls").setup_dap({ hotcodereplace = "auto" })
		-- Add additional commands
		require("jdtls.setup").add_commands()
		-- Auto-create nvim-dap main class configs. TODO: May cause slowness in on_attach
		require("jdtls.dap").setup_dap_main_class_configs()

		-- TODO: disabling JDTLS snippetSupport here causes a silent failure, nothing else will run
		-- client.resolved_capabilities.textDocument.completion.completionItem.snippetSupport = false
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local wk = require("which-key")

	wk.register({
		gD = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "[G]o to [D]eclaration" },
		gd = { "<cmd>lua vim.lsp.buf.definition()<cr>", "[G]o to [D]efinition" },
		gi = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "[G]o to [I]mplementation" },
		gr = { "<cmd>lua vim.lsp.buf.references()<cr>", "[G]o to [R]eferences" },
		gt = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "[G]o to [T]ype Definition" },
		K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
		["<leader>si"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation" },
		["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "[R]e[n]ame" },
		["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction" },
		-- ["<leader>f"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "[F]ormat" },
		["<leader>ds"] = { "<cmd>Telescope lsp_document_symbols<cr>", "[D]ocument [S]ymbols" },
		["<leader>ws"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "[W]orkspace [S]ymbols" },
		["<leader>w"] = {
			name = "Workspace",
			a = {
				"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
				"[W]orkspace [A]dd Folder",
			},
			l = {
				"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
				"[W]orkspace [L]ist Folders",
			},
			r = {
				"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
				"[W]orkspace [R]emove Folder",
			},
			d = { "<cmd>Telescope diagnostics<cr>", "[W]orkspace [D]iagnostics" },
		},
	}, { mode = "n", noremap = true, silent = true })
end

return M
