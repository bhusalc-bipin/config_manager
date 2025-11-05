-- Provides a simple and easy way to use the interface for tree-sitter in
-- Neovim and some basic functionality such as highlighting based on it.
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	-- Automatically update all the installed parsers (recommended)
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Ensures the following parsers are always installed
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"python",
				"rust",
				"go",
				"markdown",
				"markdown_inline",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			auto_install = true,

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			-- Incremental selection based on the named nodes from the grammar
			incremental_selection = {
				enable = true,
				keymaps = {
					-- Set to `false` to disable the mapping
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})
		-- Prefer git instead of curl for downloading the parsers
		require("nvim-treesitter.install").prefer_git = true
	end,
}
