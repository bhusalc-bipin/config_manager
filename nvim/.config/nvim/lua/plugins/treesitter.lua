-- Provides a simple and easy way to use the interface for tree-sitter in Neovim
-- and some basic functionality such as highlight, edit and navigate code based on it
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		-- A list parser names, or "all" (the listed parsers must always be installed)
		ensurn_installed = {},
		-- Autoinstall missing parsers when entering buffer
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
	config = function(_, opts)
		-- Prefer git instead of curl for downloading the parsers in order to improve
		-- connectivity in some environments
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)
	end,
}
