local home = os.getenv("HOME")
local db = require("dashboard")
db.custom_header = {
	"",
	"",
	"",
	"",
	"██████╗  ██████╗ ",
	"██╔══██╗ ╚════██╗",
	"██║  ██║  █████╔╝",
	"██║  ██║  ╚═══██╗",
	"██████╔╝ ██████╔╝",
	"╚═════╝  ╚═════╝ ",
	-- "░░░░░░  ░░░░░░  ",
	-- "▒▒   ▒▒      ▒▒ ",
	-- "▒▒   ▒▒  ▒▒▒▒▒  ",
	-- "▓▓   ▓▓      ▓▓ ",
	-- "██████  ██████  ",
	"",
	"",
}
db.custom_center = {
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "<leader>ff",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "NvimTreeToggle",
		shortcut = "<leader>ee",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "<leader>ft",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "Open dotfiles                           ",
	-- 	action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
	-- 	shortcut = "SPC f d",
	-- },
}
db.custom_footer = ""
