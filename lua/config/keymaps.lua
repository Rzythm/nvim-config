-- space bar leader key
vim.g.mapleader = " "

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")
vim.keymap.set("n", "<leader>ml", ":b#<cr>")

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- 使用 Shift+左箭头切换到左窗口
vim.keymap.set('n', '<S-Left>', '<C-w>h', {noremap = true, silent = true})
-- 使用 Shift+右箭头切换到右窗口
vim.keymap.set('n', '<S-Right>', '<C-w>l', {noremap = true, silent = true})
-- 使用 Shift+下箭头切换到下窗口
vim.keymap.set('n', '<S-Down>', '<C-w>j', {noremap = true, silent = true})
-- 使用 Shift+上箭头切换到上窗口 
vim.keymap.set('n', '<S-Up>', '<C-w>k', {noremap = true, silent = true})
