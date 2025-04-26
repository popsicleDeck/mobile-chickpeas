require("config.lazy")
require("plugins.nvim-treesitter")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
-- List all characters (including blank space) when running ":list"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
-- Minimal number of lines above and below the cursor
vim.opt.scrolloff = 8

vim.keymap.set("n", "<Leader><Leader>", "<Cmd>so<Space>%<Tab><CR>", { desc = "Source current file" })
