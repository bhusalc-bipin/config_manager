return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobject
                    lookahead = true,

                    keymaps = {
                        ["af"] = { query = "@function.outer", desc = "Select around a function" },
                        ["if"] = { query = "@function.inner", desc = "Select inside a function" },
                        ["ac"] = { query = "@class.outer", desc = "Select around a class" },
                        ["ic"] = { query = "@class.inner", desc = "Select inside a class" },
                        ["ao"] = { query = "@loop.outer", desc = "Select around a loop" },
                        ["io"] = { query = "@loop.inner", desc = "Select inside a loop" },
                        ["am"] = { query = "@comment.outer", desc = "Select around a comment" },
                        ["im"] = { query = "@comment.inner", desc = "Select inside a comment" },
                        ["ad"] = { query = "@conditional.outer", desc = "Select around a conditional" },
                        ["id"] = { query = "@conditional.inner", desc = "Select inside a conditional" },
                    },
                },
                move = {
                    enable = true,
                    goto_next_start = {
                        ["]f"] = { query = "@function.outer", desc = "Next function start" },
                        ["]c"] = { query = "@class.outer", desc = "Next class start" },
                        ["]o"] = { query = "@loop.outer", desc = "Next loop start" },
                        ["]m"] = { query = "@comment.outer", desc = "Next comment start" },
                    },
                    goto_next_end = {
                        ["]F"] = { query = "@function.outer", desc = "Next function end" },
                        ["]C"] = { query = "@class.outer", desc = "Next class end" },
                        ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
                        ["]M"] = { query = "@comment.outer", desc = "Next comment end" },
                    },
                    goto_previous_start = {
                        ["[f"] = { query = "@function.outer", desc = "Previous function start" },
                        ["[c"] = { query = "@class.outer", desc = "Previous class start" },
                        ["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
                        ["[m"] = { query = "@comment.outer", desc = "Previous comment start" },
                    },
                    goto_previous_end = {
                        ["[F"] = { query = "@function.outer", desc = "Previous function end" },
                        ["[C"] = { query = "@class.outer", desc = "Previous class end" },
                        ["[L"] = { query = "@loop.outer", desc = "Previous loop end" },
                        ["[M"] = { query = "@comment.outer", desc = "Previous comment end" },
                    },
                },
            },
        })
    end,
}
