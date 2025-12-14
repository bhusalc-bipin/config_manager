-- clear highlight on search after pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move selected lines up or down with shift+j or shift+k
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Toogle diagnostics
vim.keymap.set("n", "<leader>td", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
		vim.print("Diagnostics disabled!!!")
	else
		vim.diagnostic.enable()
		vim.print("Diagnostics enabled!!!")
	end
end, { desc = "toggle diagnostic" })
