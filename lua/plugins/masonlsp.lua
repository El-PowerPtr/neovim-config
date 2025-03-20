return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local mason_lsp = require "mason-lspconfig"
        mason_lsp.setup {
            ensure_installed = {
                -- "ruff",
                -- "emmet_language_server",
                -- "jedi_language_server",
                -- "r_language_server",
                -- "lua_ls",
                -- "gradle_ls",
                -- "gopls",
                -- "jdtls",
                -- "elixirls",
                -- "kotlin_language_server",
                -- "ts_ls",
                -- "metals",
                -- "hls",
                -- "html",
                -- "eslint",
                -- "sqls",
                -- "clangd",
                -- "rust_analyzer",
                -- "jsonls",
                -- "fortls",
                -- "clojure_lsp",
            },
        }
    end
}
