-- config/treesitter.lua
local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    -- 安装语言解析器
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "python",
      "javascript",
      "typescript",
      "html",
      "css",
      "markdown",
      "bash",
    },

    -- 启用代码高亮
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    -- 启用增量选择
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    -- 启用缩进
    indent = {
      enable = true,
    },

    -- 自动安装语言解析器
    auto_install = true,

    -- 其他模块配置
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = false },
    },
  })
end

return M