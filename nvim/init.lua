require("options")
require("plugins")
require("keymap")
require("autocmds")

vim.api.nvim_command([[colorscheme tokyonight]])

-- Tree Config
require("nvim-tree").setup()

-- GitSigns
require("gitsigns").setup()

local lspconfig_util = require("lspconfig.util")

-- LSP Config
local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Pull in Auto-completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Install the following language servers
local servers = {
	"bashls",
	"cssls",
	"gopls",
	"jsonls",
	"jdtls",
	"tsserver",
	"sumneko_lua",
	"intelephense",
	"pyright",
	"tailwindcss",
	"volar",
	"vuels",
	"yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
})

-- Configure LSP Servers
local lspconfig = require("lspconfig")
local lsputil = require("lspconfig.util")

lspconfig.bashls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
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
			stubs = {
				-- Defaults
				"apache",
				"bcmath",
				"bz2",
				"calendar",
				"com_dotnet",
				"Core",
				"ctype",
				"curl",
				"date",
				"dba",
				"dom",
				"enchant",
				"exif",
				"FFI",
				"fileinfo",
				"filter",
				"fpm",
				"ftp",
				"gd",
				"gettext",
				"gmp",
				"hash",
				"iconv",
				"imap",
				"intl",
				"json",
				"ldap",
				"libxml",
				"mbstring",
				"meta",
				"mysqli",
				"oci8",
				"odbc",
				"openssl",
				"pcntl",
				"pcre",
				"PDO",
				"pdo_ibm",
				"pdo_mysql",
				"pdo_pgsql",
				"pdo_sqlite",
				"pgsql",
				"Phar",
				"posix",
				"pspell",
				"readline",
				"Reflection",
				"session",
				"shmop",
				"SimpleXML",
				"snmp",
				"soap",
				"sockets",
				"sodium",
				"SPL",
				"sqlite3",
				"standard",
				"superglobals",
				"sysvmsg",
				"sysvsem",
				"sysvshm",
				"tidy",
				"tokenizer",
				"xml",
				"xmlreader",
				"xmlrpc",
				"xmlwriter",
				"xsl",
				"Zend OPcache",
				"zip",
				"zlib",
				-- Extras
				"amqp",
				"apcu",
				"grpc",
				"rdkafka",
				"redis",
			},
		},
	},
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
	flags = lsp_flags,
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
				checkThirdParty = false,
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
	flags = lsp_flags,
})

lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
})

lspconfig.html.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
})

lspconfig.cssls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
})

lspconfig.tailwindcss.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
	root_dir = lsputil.root_pattern("tailwind.config.js", "tailwind.config.ts"),
})

local function get_typescript_lib_path(root_dir)
	local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)
	return project_root and (lspconfig_util.path.join(project_root, "node_modules", "typescript", "lib")) or ""
end

lspconfig.volar.setup({
	init_options = {
		typescript = {
			tsdk = "",
		},
	},
	on_new_config = function(new_config, new_root_dir)
		new_config.init_options.typescript.tsdk = get_typescript_lib_path(new_root_dir)
	end,
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
})

lspconfig.yamlls.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
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
	flags = lsp_flags,
})

lspconfig.vuels.setup({
	on_attach = function(client, bufnr)
		require("functions").lsp_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	flags = lsp_flags,
})
