return {
	"rose-pine/neovim",
	enabled = true,
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = false,
				italic = false,
				transparency = true,
			},
		})

		vim.cmd("colorscheme rose-pine-moon")

		vim.cmd("highlight ColorColumn guibg=#181818")
		vim.cmd("highlight CursorLine guibg=#303030")
	end,
}
