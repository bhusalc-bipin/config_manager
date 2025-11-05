-- This configuration is based on kickstart.nvim (https://github.com/nvim-lua/kickstart.nvim/tree/master), with minor modifications for my setup.

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- Mason must be loaded before its dependents so we need to set it up here.
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Allows extra capabilities provided by blink.cmp
		"saghen/blink.cmp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
				end

				map("<leader>gr", require("fzf-lua").lsp_references, "go to references")
				map("<leader>gd", require("fzf-lua").lsp_definitions, "go to definitions")
				map("<leader>gD", require("fzf-lua").lsp_declarations, "go to declarations")
				map("<leader>gt", require("fzf-lua").lsp_typedefs, "go to type definitions")
				map("<leader>gi", require("fzf-lua").lsp_implementations, "go to implementations")
				map("<leader>ds", require("fzf-lua").lsp_document_symbols, "search document symbols")
				map("<leader>ws", require("fzf-lua").lsp_workspace_symbols, "search workspace symbols")
				map("<leader>dd", require("fzf-lua").lsp_document_diagnostics, "search document diagnostics")
				map("<leader>wd", require("fzf-lua").lsp_workspace_diagnostics, "search workspace diagnostics")
				map("<leader>ca", require("fzf-lua").lsp_code_actions, "search code actions")

				map("<leader>rn", vim.lsp.buf.rename, "rename")
				map("<leader>e", vim.diagnostic.open_float, "show diagnostic error message")
				map("<leader>[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, "go to prev diagnostic message")
				map("<leader>]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, "go to next diagnostic message")
				map("<leader>q", vim.diagnostic.setloclist, "open diagnostic quickfix list")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		-- Enable following language servers
		-- Need new language servers? Just add here, they will be automatically installed.
		local servers = {
			lua_ls = {},
			clangd = {},
			gopls = {},
			rust_analyzer = {},
			ty = {},
			ruff = {},
			marksman = {},
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		-- All other stuffs (other than language servers) for mason-tool-installer to install
		vim.list_extend(ensure_installed, {
			"stylua",
			"clang-format",
			"prettierd",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		-- LSP servers and clients are able to communicate to each other what features they support.
		-- By default, Neovim doesn't support everything that is in the LSP specification.
		-- When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
		-- So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		require("mason-lspconfig").setup({
			-- explicitly set to an empty table becasue mason-tool-installer is handling installation
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
