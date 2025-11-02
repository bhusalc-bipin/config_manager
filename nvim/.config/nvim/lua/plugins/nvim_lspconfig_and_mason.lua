-- Copied from kickstart.nvim
-- https://github.com/nvim-lua/kickstart.nvim
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        { "mason-org/mason.nvim", opts = {} },
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        -- Useful status updates for LSP.
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        winblend = 0, -- fully opaqye
                    },
                },
            },
        },

        -- Allows extra capabilities provided by blink.cmp
        "saghen/blink.cmp",
    },
    config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        --  That is to say, every time a new file is opened that is associated with
        --  an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --  function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
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

                -- The following autocommand is used to enable inlay hints in your code, if the
                -- language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                    vim.keymap.set(
                        "n", "<leader>th",
                        function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
                        {buffer = event.buf, desc = "toggle inlay hints"}
                    )
                end
            end,
        })

        -- Change diagnostic symbols in the sign column (gutter)
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN] = "󰀪 ",
                    [vim.diagnostic.severity.INFO] = "󰋽 ",
                    [vim.diagnostic.severity.HINT] = "󰌶 ",
                },
            },
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

        -- LSP servers and clients are able to communicate to each other what features they support.
        -- By default, Neovim doesn't support everything that is in the LSP specification.
        -- When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
        -- So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Enable the following language servers
        -- Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            clangd = {},
            gopls = {},
            rust_analyzer = {},
            ruff = {}, -- python linter and code formatter
            -- use pyright only for lsp capabilities like autocompletion, go to definition etc...
            -- for linting and formatting use ruff
            pyright = {
                settings = {
                    pyright = {
                        -- Using isort for instead
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { "*" },
                        },
                    },
                },
            },
            marksman = {}, -- for markdown files
        }

        -- Ensure the servers and tools above are installed
        --
        -- `mason` had to be setup earlier: to configure its options see the `dependencies` table for `nvim-lspconfig` above.
        --
        -- You can add other tools here that you want Mason to install for you, so that they are available from within Neovim.
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "stylua", -- Used to format Lua code
            "clang-format", -- used to format c and cpp code
            "prettierd", -- used to format markdown, html, css, js, ts...etc
            "isort", -- used to sort python imports (better than ruff and pyright)
        })

        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
