-- Collection of various small independent plugins/modules from mini.nvim library
return {
	"echasnovski/mini.nvim",
	config = function()
		-- Icon provider
		require("mini.icons").setup()

		-- Extend and create around(a) and inside(i) textobjects.
		require("mini.ai").setup({ n_lines = 500 }) -- number of lines within textobject is searched (default = 50)

		-- Surround Actions
		-- Example: sa(surround add), sr(surround replace), sd(surround delete)
		require("mini.surround").setup()

		-- Autopairs
		require("mini.pairs").setup()

		-- Statusline
		local statusline = require("mini.statusline")
		statusline.setup()
		-- Set the section for cursor location to LINE:COLUMN
		-- Default is <cursor line>|<total lines>│<cursor column>|<total columns>
		statusline.section_location = function() -- customizing statusline is expected by creating a function
			return "%2l:%-2v"
		end
	end,
}
