-- config/telescope.lua
local M = {}

function M.setup()
    require("telescope").setup{
        defaults = {
            initial_mode = 'normal',
        },
        mappings = {
            n = {
                ["<esc>"] = require('telescope.actions').close,
            },
        },
        extensions = {
            aerial = {
                -- How to format the symbols
                format_symbol = function(symbol_path, filetype)
                    -- if filetype == "json" or filetype == "yaml" then
                        return table.concat(symbol_path, ".")
                    -- else
                        -- return symbol_path[#symbol_path]
                    -- end
                end,
                -- Available modes: symbols, lines, both
                show_columns = "both",
            },
        },
    }
    
end

return M