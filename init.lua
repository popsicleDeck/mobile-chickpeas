require("config.lazy")
require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
})
require("config.autocmd")

vim.g.python3_host_prog = "/usr/bin/python3"
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
vim.opt.statusline = "%n %<%f %h%m%=%-14.(%l,%V%) %P" --add bufnr, remove a few things that aren't needed
vim.opt.autochdir = true --relative paths in buffers

vim.keymap.set("n", "<Leader><Leader>", "<Cmd>so<Space>%<Tab><CR>", { desc = "Source current file" })
vim.keymap.set("n", "<Leader>o", "<Cmd>Oil<CR>", { desc = "Run Oil" })
vim.keymap.set("n", "<Leader>q", "<Cmd>nohls<CR>", { desc = "cancel highlights" })
vim.keymap.set("n", "<Leader>f", "<Cmd>FzfLua<CR>", { desc = "Run Fzf" })

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#30cfc9", fg = "#3c445c" })
