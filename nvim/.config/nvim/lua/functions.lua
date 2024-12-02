local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.lsp_on_attach(client, bufnr)
	-- Disable Built-in LSP formatting in favor of null-ls
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	-- Add intelligent highlighting
	-- require("illuminate").on_attach(client)

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
	-- local wk = require("which-key")
	--
	-- wk.add({
	-- 	{ "<leader>si", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Documentation", remap = false },
	-- 	{ "<leader>w", group = "Workspace", remap = false },
	-- 	{
	-- 		"<leader>wa",
	-- 		"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
	-- 		desc = "[W]orkspace [A]dd Folder",
	-- 		remap = false,
	-- 	},
	-- 	{ "<leader>wd", "<cmd>Telescope diagnostics<cr>", desc = "[W]orkspace [D]iagnostics", remap = false },
	-- 	{
	-- 		"<leader>wl",
	-- 		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
	-- 		desc = "[W]orkspace [L]ist Folders",
	-- 		remap = false,
	-- 	},
	-- 	{
	-- 		"<leader>wr",
	-- 		"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
	-- 		desc = "[W]orkspace [R]emove Folder",
	-- 		remap = false,
	-- 	},
	-- 	{
	-- 		"<leader>ws",
	-- 		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
	-- 		desc = "[W]orkspace [S]ymbols",
	-- 		remap = false,
	-- 	},
	-- }, { mode = "n", noremap = true, silent = true })
end

return M
