return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local mason_lsp = require "mason-lspconfig"
        mason_lsp.setup {
            ensure_installed = {
                "ruff",
                "basedpyright",
                "lua_ls",
                "emmet_language_server",
                --"jdtls",
                "hls",
                "html",
                "eslint",
                "sqls",
                "clangd",
                "gopls",
                "rust_analyzer",
                "jsonls",
                "fortls",
                "elixirls",
            },
        }
    end
}
