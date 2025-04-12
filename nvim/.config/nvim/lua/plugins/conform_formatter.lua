-- formatter plugin
-- helps with (auto)formating the code
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	dependencies = {
		"mason.nvim",
	},
	keys = {
		{
			"<leader>f",
			function()
				-- "fallback": LSP formatting is used when no other formatters are available
				require("conform").format({ lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		-- configure the formatter to be used for specified file type
		formatters_by_ft = {
			c = { "clang-format" },
			lua = { "stylua" },
			htmldjango = { "djlint" },

			html = { "prettierd" },
			css = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" }, -- React / JSX
			typescriptreact = { "prettierd" }, -- React / TSX
			json = { "prettierd" },
			markdown = { "prettierd" },

			python = { "isort", "ruff_format" },
		},

		format_on_save = {
			-- time in milliseconds to block for formatting. No effect if async = true
			timeout_ms = 500, -- default: 1000
			-- configure if and when LSP should be used for formatting
			-- "fallback": LSP formatting is used when no other formatters are available
			lsp_format = "fallback", -- default: "never"
		},
	},
}
