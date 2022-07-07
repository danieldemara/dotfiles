local autopairs = require("nvim-autopairs")
autopairs.setup({
	check_ts = true,
	--	enable_check_bracket_line = false,
	disable_filetype = { "TelescopePrompt" },
	--	ts_config = {
	--		lua = { "string" }, -- it will not add a pair on that treesitter node
	--		javascript = { "template_string" },
	--		java = false, -- don't check treesitter on java
	--	},
})
