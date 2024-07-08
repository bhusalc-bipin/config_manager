-- Collection of various small independent plugins/modules from mini.nvim
return {
	"echasnovski/mini.nvim",
	-- Optional dependencies
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Helps visualize scope with animated vertical line
		-- Helpful for languages where indentation is important. Example: Python
		require("mini.indentscope").setup()

		-- Helps navigate and manipulate file system like an file explorer in VSCode
		require("mini.files").setup({
			-- icons are showing as "?" because of not having nerd-font
			-- so, removing the icons (prefix). When nerdfont is installed
			-- 1 line below can be deleted and it will show the files/directory
			-- icons.
			-- content = { prefix = function() end },
			vim.keymap.set("n", "<leader>p", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open mini.files" }),
		})

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
