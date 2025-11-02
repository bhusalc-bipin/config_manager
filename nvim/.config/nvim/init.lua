-- Set <space> as the leader key
-- NOTE: Must set leader key before plugins are loaded, otherwise wrong leader might be used
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")

require("core.keymaps")

require("core.autocommands")

-- Load plugin manager
require("core.lazy")
