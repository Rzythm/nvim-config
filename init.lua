-- init.lua
vim.g.mapleader = " "

-- 安装 lazy.nvim
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

-- 重命名调试函数避免冲突
function _G.debug_print(...)
    vim.notify(vim.inspect({...}))
end

-- 仅加载不依赖插件的基础配置
require('config.core')    -- vim.opt 等纯 Neovim 设置
require('config.keymaps') -- 快捷键绑定

-- 初始化插件管理器
require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = { -- 禁用不需要的默认插件
        "gzip",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      }
    }
  }
})

-- 主题等插件相关配置应该通过插件的 config 回调加载