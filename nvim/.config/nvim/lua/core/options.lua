-- Set tabstops
vim.opt.tabstop = 4 -- number of spaces that a tab character (\t) represents
vim.opt.softtabstop = 4 -- number of spaces a tab key press inserts or backspace removes when editing
vim.opt.shiftwidth = 4 -- number of spaces used for each level of indentation

-- Make line numbers default
vim.opt.number = true

-- Add relative line numbers to help with jumping
vim.opt.relativenumber = true

-- Enable mouse mode (can be useful for resizing splits for example!)
vim.opt.mouse = "a"

-- Don't show the current mode
-- Statusline plugin shows the mode
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- Enable break-indent
-- Makes wrapped lines align with the indentation of the original line
vim.opt.breakindent = true

-- Save undo history (enables undo even after you quit and reopen file)
vim.opt.undofile = true

-- Case-insensitive searching unless \C or one or more capital letters is in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
-- If this many milliseconds nothing is typed the swap file will be written to disk.
-- Also used for the `CursorHold` autocommand event.
vim.opt.updatetime = 250 -- default 4000 ms

-- Decrease mapped sequence wait time i.e. time neovim waits for a mapped sequence to complete
vim.opt.timeoutlen = 500 -- default 1000 ms

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type
vim.opt.inccommand = "split"

-- Highlight the entire line where the cursor is currently positioned
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Create a vertical line in screen at the given column position
vim.opt.colorcolumn = "80"

-- Highlight all matches of your search pattern in the current buffer
vim.opt.hlsearch = true
