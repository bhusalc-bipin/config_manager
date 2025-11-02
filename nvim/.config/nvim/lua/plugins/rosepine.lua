-- Colorscheme
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
	end,
}
