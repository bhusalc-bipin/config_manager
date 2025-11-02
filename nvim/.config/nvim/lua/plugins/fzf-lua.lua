return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-mini/mini.icons" },
	opts = {
		keymap = {
			fzf = {
				["ctrl-q"] = "select-all+accept",
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

		{
			"<leader>gr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "go to references",
		},
		{
			"<leader>gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "go to definitions",
		},
		{
			"<leader>gD",
			function()
				require("fzf-lua").lsp_declarations()
			end,
			desc = "go to declarations",
		},
		{
			"<leader>gt",
			function()
				require("fzf-lua").lsp_typedefs()
			end,
			desc = "go to type definitions",
		},
		{
			"<leader>gi",
			function()
				require("fzf-lua").lsp_implementations()
			end,
			desc = "go to implementations",
		},
		{
			"<leader>ds",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "search document symbols",
		},
		{
			"<leader>ws",
			function()
				require("fzf-lua").lsp_workspace_symbols()
			end,
			desc = "search workspace symbols",
		},
		{
			"<leader>dd",
			function()
				require("fzf-lua").lsp_document_diagnostics()
			end,
			desc = "search document diagnostics",
		},
		{
			"<leader>wd",
			function()
				require("fzf-lua").lsp_workspace_diagnostics()
			end,
			desc = "search workspace diagnostics",
		},
		{
			"<leader>ca",
			function()
				require("fzf-lua").lsp_code_actions()
			end,
			desc = "search code actions",
		},

		-- Following keymappings are not based on fzf-lua, but on vim builtin API.
		-- I wasn't sure where to put these. So, just left here along with other lsp keymappings.
		{ "<leader>rn", vim.lsp.buf.rename, desc = "rename" },
		{ "<leader>e", vim.diagnostic.open_float, desc = "show diagnostic error message" },
		{
			"<leader>[d",
			function()
				vim.diagnostic.jump({ count = -1, float = true })
			end,
			desc = "go to prev diagnostic message",
		},
		{
			"<leader>]d",
			function()
				vim.diagnostic.jump({ count = 1, float = true })
			end,
			desc = "go to next diagnostic message",
		},
		{ "<leader>q", vim.diagnostic.setloclist, desc = "open diagnostic quickfix list" },
	},
}
