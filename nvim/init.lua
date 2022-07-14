require("options")
require("plugins")
require("keymap")
require("autocmds")

vim.api.nvim_command([[colorscheme tokyonight]])

-- Tree Config
require("nvim-tree").setup()

-- GitSigns
require("gitsigns").setup()

-- LSP Config
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Setup lspconfig.
local lspconfig = require("lspconfig")
local lsputil = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.bashls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.intelephense.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
	settings = {
		intelephense = {
			files = {
				maxSize = 3000000,
			},
		},
	},
})

lspconfig.jdtls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
})

lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			linksInHover = false,
			codelenses = {
				generate = true,
				gc_details = true,
				regenerate_cgo = true,
				tidy = true,
				upgrade_depdendency = true,
				vendor = true,
			},
			usePlaceholders = true,
		},
	},
})

lspconfig.sumneko_lua.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	rlags = lsp_flags,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.pyright.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.html.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	root_dir = lsputil.root_pattern("tailwind.config.js", "tailwind.config.ts"),
})

lspconfig.volar.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.yamlls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				kubernetes = "*.yaml",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
				["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
				["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
			},
			format = { enabled = false },
			completion = true,
			hover = true,
		},
	},
})

lspconfig.jsonls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})
