-- plugins/init.lua
return {
    -- nvim-web-devicons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    -- Treesitter 插件
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-refactor",
        },
        build = ":TSUpdate",
        config = function()
            require("plugins.config.treesitter").setup()
        end,
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
            require("plugins.config.lualine").setup()
        end,
    },
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.config.telescope").setup()
        end,
    },
    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",             -- 主自动补全插件
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
            },
        },
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
        config = function()
            require("plugins.config.nvim-cmp").setup()
        end
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
                ensure_installed = { "gopls", "lua_ls", "rust_analyzer" },
                automatic_installation = false,
            })
    
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            })
        end
    },
    -- nvim-autopairs 插件
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.config.autopairs")
        end,
    },
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.config.lsp").setup()
        end,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- 用于 nvim-cmp 获取补全功能
        }
    },
    -- 其他插件...
  }