return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
			enable_check_bracket_line = false,
			disable_filetype = { "TelescopePrompt" },
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
		})
		-- If you want to automatically add `(` after selecting a function or method
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
