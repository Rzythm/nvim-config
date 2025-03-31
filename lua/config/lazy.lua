-- Install lazylazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true -- 启用 24 位真彩色，必须开启以支持主题

require('lazy').setup({
    -- Codeium
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    },
    -- Treesitter 配置
    {
        "nvim-treesitter/nvim-treesitter",
        priority = 1000,
        build = ":TSUpdate", -- 自动更新 Treesitter 解析器
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "lua", "cpp", "go", "python", "html", "rust" },
                highlight = { enable = false },
                indent = { enable = true },
                fold = { enable = true },
            }
            vim.o.foldmethod = "expr"
            vim.o.foldexpr = "nvim_treesitter#foldexpr()"
        end,
    },
    -- leetcode
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            cn = {     -- leetcode.cn
                enabled = true, ---@type boolean
                translator = true, ---@type boolean
                translate_problems = true, ---@type boolean
            },
            -- configuration goes here
        },
    },
    -- theme setup
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme catppuccin")
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- -- auto-session
    -- {
    --     'rmagatti/auto-session',
    --     lazy = false,
    --     opts = {
    --         suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    --         -- log_level = 'debug',
    --     }
    -- },
    -- markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- FILE tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- Visualize buffers as tabs
    { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },

    -- nvim comments
    {
        'terrortylor/nvim-comment',
        config = function()
            require("nvim_comment").setup({ create_mappings = false })
        end
    },

    -- lualine.nvim（状态栏美化）
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-web-devicons" }, -- 依赖图标插件
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin", -- 与主题同步
                    section_separators = { left = "", right = "" },
                    component_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },

    -- nvim-cursorline 光标跳动美化
    {
        "yamatsum/nvim-cursorline",
        config = function()
            require("nvim-cursorline").setup({
                cursorline = {
                    enable = true,
                    timeout = 1000, -- 高亮持续时间
                    number = false, -- 不高亮行号
                },
                cursorword = {
                    enable = true,
                    min_length = 3,            -- 高亮单词最小长度
                    hl = { underline = true }, -- 下划线效果
                },
            })
        end,
    },


    -- 配置 LSP 插件
    {
        "neovim/nvim-lspconfig", -- LSP 配置插件
        config = function()
            local lspconfig = require("lspconfig")

            -- 配置 clangd LSP
            require 'lspconfig'.clangd.setup {
                cmd = { "clangd" },                                                                -- 使用 clangd 命令
                filetypes = { "c", "cpp", "objc", "objcpp" },                                      -- 支持 C/C++/Objective-C
                root_dir = require 'lspconfig'.util.root_pattern("compile_commands.json", ".git"), -- 查找项目根目录
            }
            -- 配置 Go LSP (gopls)
            lspconfig.gopls.setup({
                cmd = { "gopls" }, -- 使用安装的 gopls
                filetypes = { "go", "gomod" },
                root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
                settings = {
                    gopls = {
                        analyses = {
                            unreachable_code = true,
                            unusedparams = true,
                        },
                        staticcheck = true, -- 启用 staticcheck 分析工具
                    }
                },
            })
            -- 配置 rust-analyzer
            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        checkOnSave = { command = "clippy" },
                    }
                }
            })
            -- 配置 Lua LSP (sumneko_lua)
            lspconfig.lua_ls.setup({
                cmd = { "lua-language-server" },
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },                             -- 让 Lua LSP 识别 `vim` 全局变量
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) }, -- 配置 Neovim 相关的 Lua 库
                        telemetry = { enable = false },                                    -- 禁用遥测数据收集
                    },
                },
            })
        end -- 结束 Lua LSP 配置
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",             -- 主自动补全插件
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP 补全源
            "hrsh7th/cmp-buffer",       -- 缓冲区补全源
            "hrsh7th/cmp-path",         -- 路径补全源
            "saadparwaiz1/cmp_luasnip", -- Snippet 补全源
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- 使用 luasnip 插件的 Snippets 功能
                    end,
                },
                mapping = {
                    ["<Down>"] = cmp.mapping.select_next_item(),        -- 向下选择补全项
                    ["<Up>"] = cmp.mapping.select_prev_item(),          -- 向上选择补全项
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Tab 确认补全
                    ["<C-e>"] = cmp.mapping.abort(),                    -- Ctrl+e 关闭补全菜单
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'luasnip' },
                },
            })
        end
    },
    -- nvim-autopairs 插件
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    -- Mason 插件，用于安装和管理 LSP 服务器
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup() -- 初始化 mason
        end
    },

    -- Mason LSP 配置插件，简化配置 LSP 服务器
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {}, -- 这里可以手动添加 LSP 服务器
            })
        end
    },
})
