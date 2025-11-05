-- Picker
return {
	"ibhagwan/fzf-lua",
	-- Optional for icon support
	dependencies = { "nvim-mini/mini.icons" },
	opts = {
		keymap = {
			fzf = {
				["ctrl-q"] = "select-all+accept", -- Add current search items to quickfix list
			},
		},
	},
	keys = {
		{
			"<leader>sf",
			function()
				require("fzf-lua").files()
			end,
			desc = "search file",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "live grep the current buffer",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "live grep current project",
		},
		{
			"<leader>sw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "search current word",
		},
		{
			"<leader>sW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "search current WORD",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "search existing buffers",
		},
		{
			"<leader>so",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "search old Files",
		},
		{
			"<leader>sq",
			function()
				require("fzf-lua").quickfix()
			end,
			desc = "live grep the quickfix list",
		},
		{
			"<leader>sr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "search resume",
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "search fzf-lua builtin commands",
		},
	},
	config = function()
		-- FIXME: Getting an error message when use <leader>ca for code actions
		-- Don't know why. So, temporary fix for now.
		-- Error message: "FzfLua is not currently registered as 'vim.ui.select' backend, use 'silent=true'
		-- to hide this message or register globally using ':FzfLua register_ui_select'."
		require("fzf-lua").register_ui_select({ silent = true })
	end,
}
