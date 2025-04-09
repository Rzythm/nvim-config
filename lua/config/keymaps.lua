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

--ctrl+t 打开新建空标签页
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })

-- 切换到上一个标签页
vim.api.nvim_set_keymap('n', '<Tab><Left>', ':tabprev<CR>', { noremap = true, silent = true })

-- 切换到下一个标签页
vim.api.nvim_set_keymap('n', '<Tab><Right>', ':tabnext<CR>', { noremap = true, silent = true })

-- 下方分屏并打开终端
vim.keymap.set("n", "<leader>td", ":botright 10split | terminal<CR>i", { noremap = true, silent = true })

-- esc退出终端模式
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", ":bd!<CR>", { noremap = true, silent = true })

local opts = { noremap = true, silent = true }

-- Leader + ' 绑定为 :Leet run
vim.keymap.set("n", "<Leader>'", ":Leet run<CR>", opts)

-- Leader + Enter 绑定为 :Leet submit
vim.keymap.set("n", "<Leader><CR>", ":Leet submit<CR>", opts)

-- ✅ 普通/可视模式下 Ctrl+C 复制到系统剪贴板
vim.keymap.set({ "n", "v" }, "<C-c>", "\"+y", {
  silent = true,
  desc = "Copy to system clipboard (Ctrl+C in normal/visual)"
})

-- ✅ 插入模式下 Ctrl+C：复制当前行到剪贴板（退出→复制→返回）
vim.keymap.set("i", "<C-c>", "<Esc>\"+yya", {
  silent = true,
  desc = "Copy current line (Ctrl+C in insert)"
})

-- ✅ 普通/可视模式下 Ctrl+V 粘贴剪贴板内容
vim.keymap.set({ "n", "v" }, "<C-v>", "\"+p", {
  silent = true,
  desc = "Paste from system clipboard (Ctrl+V in normal/visual)"
})

-- ✅ 插入模式下 Ctrl+V 粘贴剪贴板内容
vim.keymap.set("i", "<C-v>", "<C-r>+", {
  silent = true,
  desc = "Paste from system clipboard (Ctrl+V in insert)"
})


-- 悬浮查看文档
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })

-- 跳转到定义
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })

-- 显示符号预览（Peek）
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })

-- 显示诊断信息（报错等）
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
-- 在 lspconfig 的 on_attach 函数中添加

-- 跳回声明
vim.keymap.set('n', '<leader>gb', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = true }) 

-- 查看引用
vim.keymap.set('n', '<leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { buffer = true })  

