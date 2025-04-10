-- theme.lua: 主题设置

-- 启用 24 位真彩色，必须开启以支持主题
vim.opt.termguicolors = true

-- 设置 Catppuccin 主题
require("lazy").setup({
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,  -- 设置优先级，确保主题优先加载
      config = function()
        -- 设置主题为 catppuccin
        vim.cmd("colorscheme catppuccin")
      end
    }
  })