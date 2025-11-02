-- plugin that properly configures LuaLS for editiong Neovim config by lazily updating
-- workspace libraries
return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
