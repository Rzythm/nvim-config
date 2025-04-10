-- config/lsp.lua
local M = {}

function M.setup()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Clangd
    lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { "/usr/bin/clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
    })

    -- gopls
    lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod" },
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        settings = {
            gopls = {
                analyses = {
                    unreachable_code = true,
                    unusedparams = true,
                },
                staticcheck = true,
            }
        },
    })

    -- rust-analyzer
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = true },
                checkOnSave = { command = "clippy" },
            }
        }
    })

    -- Lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        cmd = { "lua-language-server" },
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                telemetry = { enable = false },
            }
        }
    })
end

return M