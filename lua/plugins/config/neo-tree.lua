local M = {}

M.setup = function()
    require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
            filtered_items = {
                visible = true,     -- 显示隐藏文件
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            follow_current_file = {
                enabled = true,     -- 自动跟随当前文件
            },
        },
        window = {
            width = 30,
            mappings = {
                ["<space>"] = "none",     -- 禁用默认空格键映射
            }
        },
        default_component_configs = {
            icon = {
                folder_closed = "📁",
                folder_open = "📂",
                folder_empty = "🗁",
            }
        }
    })
end

return M
