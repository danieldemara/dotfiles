local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local phpcs_in_root = require("null-ls.utils").make_conditional_utils().root_has_file({ ".phpcs.xml" })
local phpcs_extra_args = function(params)
	if phpcs_in_root then
		return {}
	end

	return {
		"--standard=src/.phpcs.xml",
	}
end

null_ls.setup({
	sources = {
		-- Git
		null_ls.builtins.code_actions.gitsigns,

		-- PHP
		null_ls.builtins.formatting.phpcbf.with({
			prefer_local = "vendor/bin",
			extra_args = phpcs_extra_args,
		}),
		-- null_ls.builtins.diagnostics.phpcs.with({
		--     prefer_local = "vendor/bin",
		--     extra_args = phpcs_extra_args,
		-- }),

		-- Python
		-- null_ls.builtins.diagnostics.flake8.with({
		-- 	prefer_local = "venv/bin",
		-- 	condition = function(utils)
		-- 		return not utils.root_has_file({ ".pylintrc" })
		-- 	end,
		-- }),
		null_ls.builtins.diagnostics.pylint.with({
			prefer_local = "venv/bin",
			condition = function(utils)
				return utils.root_has_file({ ".pylintrc" })
			end,
		}),
		null_ls.builtins.formatting.black,

		-- JS
		-- null_ls.builtins.code_actions.eslint_d.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ ".eslintrc.js" })
		-- 	end,
		-- }),
		-- null_ls.builtins.diagnostics.eslint_d.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ ".eslintrc.js" })
		-- 	end,
		-- }),
		-- null_ls.builtins.formatting.eslint_d.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ ".eslintrc.js" })
		-- 	end,
		-- }),
		null_ls.builtins.formatting.prettierd,

		-- Java
		null_ls.builtins.formatting.google_java_format.with({
			extra_args = { "--aosp" }, -- Use AOSP style to use 4 space indentation instead of 2
		}),

		-- Go
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.gofumpt,

		-- Lua
		null_ls.builtins.formatting.stylua,

		-- JSON
		null_ls.builtins.formatting.jq,

		-- Terraform
		null_ls.builtins.formatting.terraform_fmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
