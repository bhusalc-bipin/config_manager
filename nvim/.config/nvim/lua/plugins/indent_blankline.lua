-- Helps visualize scope with animated vertical line
return {
	"lukas-reineke/indent-blankline.nvim",
	opts = function()
		return {
			indent = {
				char = "│",
				-- tab_char = "│",
			},
			scope = { show_start = false, show_end = false },
		}
	end,
	main = "ibl",
}
