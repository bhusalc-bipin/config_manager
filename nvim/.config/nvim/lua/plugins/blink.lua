-- Completion plugin with support for LSPs, cmdline, signature help, and snippets
return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip", -- snippet engine
            -- follow latest release
            version = "2.*",
            build = "make install_jsregexp",
            opts = {},
        },
        "folke/lazydev.nvim"
    },
    opts = {
        keymap = {
            preset = "default", -- mappings similar to built-in completions (`<c-y>`to accept)
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        completion = {
            -- only show the documentation popup when manually triggered (<ctr + space>)
            documentation = { auto_show = false, },
        },

        -- show a signature help window while typing arguments for a function
        signature = { enabled = true },

        snippets = { preset = "luasnip" },

        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },

        -- Rust fuzzy matcher ("lua" alternative available)
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
}
