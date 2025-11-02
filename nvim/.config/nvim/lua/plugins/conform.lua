-- helps with (auto)formatting the code
return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				-- "fallback": LSP formatting is used when no other formatters are available
				require("conform").format({ lsp_format = "fallback" })
			end,
			desc = "format buffer",
		},
	},
	opts = {
		notify_on_error = true,
		notify_no_formatters = true,

		-- enable auto format
		format_on_save = {
			-- time in millisecond to block for formatting. No effect if async = true
			timeout_ms = 500,
			-- configure if and when LSP should be used for formatting
			-- "fallback": LSP formatting is used when no other formatters are available
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			-- all these packages are installed by mason, so if you need to add more, make
			-- sure to include that in mason install list in `nvim_lspconfig_and_mason.lua` file
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
			python = { "isort", "ruff_format" },
			markdown = { "prettierd" },
		},
	},
}
