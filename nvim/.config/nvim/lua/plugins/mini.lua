-- Collection of various small independent plugins/modules from mini.nvim library
return {
	"echasnovski/mini.nvim",
	config = function()
		-- Icon provider
		require("mini.icons").setup()

		-- Better Around/Inside textobjects
		-- Examples:
		--    - va) - [Visually] select [A]round [)]paren
		--    - yinq - [Y]ank [I]nside [N]ext [']quote
		--    - ci' - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 }) -- number of lines within textobject is searched (default = 50)

		-- Add/delete/replace/find/highlight surroundings (brackets, quotes, etc.)
		-- Examples:
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Helps navigate and manipulate file system like an file explorer in VSCode
		require("mini.files").setup({
			vim.keymap.set("n", "<leader>p", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open mini.files" }),
		})

		-- Simple and easy statusline
		local statusline = require("mini.statusline")
		statusline.setup()
		-- Set the section for cursor location to LINE:COLUMN
		-- Default is <cursor line>|<total lines>│<cursor column>|<total columns>
		statusline.section_location = function() -- customizing statusline is expected by creating a function
			return "%2l:%-2v"
		end

		-- Autopairs
		require("mini.pairs").setup()
	end,
}
