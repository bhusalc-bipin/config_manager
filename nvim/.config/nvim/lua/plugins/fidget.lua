-- Extensible UI for Neovim notification and LSP progress messages
return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			window = {
				winblend = 0, -- fully opaque
			},
		},
	},
}
