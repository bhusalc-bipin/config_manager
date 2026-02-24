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
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#161b22" })
		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#161616" })
	end,
}
