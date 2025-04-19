require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

vim.keymap.set('n', '<Leader><Leader>', '<Cmd>so<Space>%<Tab><CR>', { desc = 'Source current file' })


