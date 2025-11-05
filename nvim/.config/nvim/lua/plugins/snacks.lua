-- A collection of small QoL plugins for Neovim
return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		-- Visualize indent guides and scopes based on treesitter or indent
		indent = { enabled = true },
	},
}
