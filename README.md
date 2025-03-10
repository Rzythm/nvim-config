# This is FakeSmile's nvim-config

## plugins

1. telescope

| 快捷键 | 命令 | 功能描述 |
|--------|------|----------|
| `<leader>fs` | `:Telescope find_files<cr>` | 查找文件 |
| `<leader>fp` | `:Telescope git_files<cr>` | 查找 Git 仓库文件 |
| `<leader>fz` | `:Telescope live_grep<cr>` | 实时搜索文本内容 |
| `<leader>fo` | `:Telescope oldfiles<cr>` | 查找最近打开的文件 |
| `<leader>fb` | `:Telescope buffers<cr>` | 查找当前缓冲区 |
| `<leader>fh` | `:Telescope help_tags<cr>` | 搜索帮助文档标签 |

2. file_tree

| 快捷键 | 命令 | 功能描述 |
|--------|------|----------|
| `<leader>e` | `:NvimTreeFindFileToggle<cr>` | 开启/关闭文件树 |

3. nvim-comment

| 快捷键 | 命令 | 功能描述 |
|--------|------|----------|
| `<leader>/` | `:CommentToggle<cr>` | 添加/删除注释 |

4. LSP format

| 快捷键 | 命令 | 功能描述 |
|--------|------|----------|
| `<leader>fmd` | `vim.lsp.buf.format` | 格式化代码 (LSP) |

5. markdown preview

| 快捷键 | 命令 | 功能描述 |
|--------|------|----------|
| `<leader>mp` | `:MarkdownPreviewToggle<cr>` | 切换 Markdown 预览 |
