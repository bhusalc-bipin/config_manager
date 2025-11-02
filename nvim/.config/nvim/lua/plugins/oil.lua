-- File explorer
return {
    "stevearc/oil.nvim",
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    opts = {
        -- Send deleted files to the trash instead of permanently deleting them
        delete_to_trash = true,
        view_options = {
            show_hidden = true, -- show hidden files and directories
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, _)
                local hide_list = { "..", ".git", "_build" }
                return vim.tbl_contains(hide_list, name)
            end,
        },
        keymaps = {
            ["q"] = { "actions.close", mode = "n" },
            ["<leader>p"] = "actions.preview",
            ["<leader>."] = { "actions.toggle_hidden", mode = "n" },
        },
    },
    keys = {
        { "<leader>-", "<cmd>Oil<cr>", desc = "Open File Explorer (oil.nvim)" },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
}
