-- Plugin to highlight and search for todo comments like
-- FIX, TODO, HACK, WARN, PERF, NOTE, TEST
return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- Don't show icons in the sign column
		signs = false,
	},
}
