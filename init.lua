require("config.lazy")
require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
})
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
-- List all characters (including blank space) when running ":list"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.cursorline = true
-- Minimal number of lines above and below the cursor
vim.opt.scrolloff = 7

vim.keymap.set("n", "<Leader><Leader>", "<Cmd>so<Space>%<Tab><CR>", { desc = "Source current file" })
vim.keymap.set("n", "<Leader>o", "<Cmd>Oil<CR>", { desc = "Run Oil" })
vim.keymap.set("n", "<Leader>q", "<Cmd>nohls<CR>", { desc = "cancel highlights" })
vim.keymap.set("n", "<Leader>n", "$a<CR>", { desc = "enter insert mode at the line bellow the current cursor" })
