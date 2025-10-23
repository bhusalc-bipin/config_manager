return {
	"gbprod/nord.nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("nord")

		vim.api.nvim_set_hl(0, "MiniFilesTitle", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "NormalFloat" })

		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "NONE", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "NONE", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "NONE", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "NONE", bg = "NONE" })

		local bg_main = "#303030"

		vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { fg = "#a9b1d6", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { fg = "#a9b1d6", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = "#a9b1d6", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = "#7aa2f7", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = "#7aa2f7", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = "#9ece6a", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = "#bb9af7", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = "#f7768e", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = "#e0af68", bg = bg_main })
		vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = "#7dcfff", bg = bg_main })

		vim.api.nvim_set_hl(0, "FidgetBg", { bg = bg_main })

		vim.cmd("highlight Normal guibg=#131212d0")
		vim.cmd("highlight SignColumn guibg=#131212d0")
		vim.cmd("highlight ColorColumn guibg=#171717")
		vim.cmd("highlight CursorLine guibg=#303030")
	end,
}
