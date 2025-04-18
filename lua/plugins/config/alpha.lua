local M = {}

M.setup = function()
  local dashboard = require("alpha.themes.dashboard")

local logo = [[
    ██████╗   ███████╗  ██╗    ██╗ ████████╗ ██╗  ██╗  ███╗   ███╗         
    ██╔══██╗  ╚══███╔╝  ╚██╗  ██╔╝ ╚══██╔══╝ ██║  ██║  ████╗ ████║     
    ██████╔╝    ███╔╝    ╚████╔╝      ██║    ███████║  ██╔████╔██║       
    ██╔══██╗   ███╔╝      ╚██╔╝       ██║    ██╔══██║  ██║╚██╔╝██║        
    ██║  ██║  ███████╗     ██║        ██║    ██║  ██║  ██║ ╚═╝ ██║          
    ╚═╝  ╚═╝  ╚══════╝     ╚═╝        ╚═╝    ╚═╝  ╚═╝  ╚═╝     ╚═╝   
                             R Z Y T H M
]]

  dashboard.section.header.val = vim.split(logo, "\n")
  dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("e", " " .. " Open file-tree", ":Neotree<CR>"),
    dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  }

  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
  end

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "AlphaHeader"
  dashboard.section.buttons.opts.hl = "AlphaButtons"
  dashboard.opts.layout[1].val = 8

  -- 启动 Alpha
  require("alpha").setup(dashboard.opts)

  -- Lazy 和 AlphaReady 联动
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        require("lazy").show()
      end,
    })
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
