local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		-- null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.goimports,
		-- null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.diagnostics.phpcs.with({
			prefer_local = "vendor/bin",
		}),
		null_ls.builtins.formatting.phpcbf.with({
			prefer_local = "vendor/bin",
		}),
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
