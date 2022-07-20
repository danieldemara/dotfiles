local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.lsp_on_attach(client, bufnr)
	-- Disable Built-in LSP formatting in favor of null-ls
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

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
		l = {
			name = "LSP",
			D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
			i = {
				"<cmd>lua vim.lsp.buf.implementation()<cr>",
				"Show implementations",
			},
			R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
			e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
			-- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
			k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
			l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
			n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
			p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix Diagnostics" },
			r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
			w = {
				name = "workspaces",
				a = {
					"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
					"Add Workspace Folder",
				},
				d = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
					"List Workspace Folders",
				},
				r = {
					"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
					"Remove Workspace Folder",
				},
				s = {
					"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
					"Workspace Symbols",
				},
			},
		},
	}, { prefix = "<leader>", mode = "n", noremap = true, silent = true })

	-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<space>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

return M
