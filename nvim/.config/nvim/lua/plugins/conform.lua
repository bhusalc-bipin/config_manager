-- Helps with (auto)formatting the code
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
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

		-- Enable auto format
		format_on_save = {
			-- Time in millisecond to block for formatting. No effect if async = true
			timeout_ms = 500,
			-- Configure if and when LSP should be used for formatting
			-- "fallback": LSP formatting is used when no other formatters are available
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			-- Make sure the following stuffs are in `mason-tool-installer` ensure install
			-- (see `nvim_lspconfig.lua` file)
			lua = { "stylua" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
			python = { "ruff_organize_imports", "ruff_format" },
			markdown = { "prettierd" },
		},
	},
}
