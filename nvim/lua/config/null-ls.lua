local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- null_ls.require("null-ls").builtins.formatting.stylua,
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.goimports,
    -- null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.diagnostics.phpcs.with({
      prefer_local = "vendor/bin",
    }),
    null_ls.builtins.formatting.phpcbf.with({
      prefer_local = "vendor/bin",
    })
  },
})
