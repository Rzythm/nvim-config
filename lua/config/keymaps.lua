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


-- telescope
vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")

-- tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>")

-- nvim-comment
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")

-- format code using LSP
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

vim.keymap.set('n', '<leader>ts', '<cmd>Telescope treesitter parsers<CR>')

-- Peek 定义
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })

-- Hover 文档（替代原生 hover）
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover doc" })
-- 函数签名（signature help）
vim.keymap.set({'v', 'n'}, 'gK', function ()
  vim.lsp.buf.signature_help()
end)
-- 查找定义（使用 Telescope）
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = 'Goto definition' })
-- 查找声明（内建）
vim.keymap.set("n", "gD", function()
    vim.lsp.buf.declaration()
end, { desc = 'Goto declaration' })

-- 重命名（弹窗输入）
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol" })
