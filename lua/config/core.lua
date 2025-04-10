-- core.lua: 核心配置（界面设置、常规选项）

-- 设置行号显示
vim.opt.number = true           -- 显示行号
vim.opt.relativenumber = true   -- 显示相对行号

-- 启用行高亮
vim.opt.cursorline = true

-- 开启自动缩进
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 启用行尾空格标记
vim.opt.listchars = { eol = '↴', tab = '▸▸', trail = '·' }
vim.opt.list = true

-- 设置搜索
vim.opt.ignorecase = true      -- 忽略大小写
vim.opt.smartcase = true       -- 智能大小写

