return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require "conform"
        conform.setup {
            lua = { "stylua" },
            python = { "ruff" },
            go = { "gofumpt" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            jsx = { "prettier" },
            tsx = { "prettier" },
            haskell = { "ormulu" },
            fortran = { "fprettify", "findent" },

            format_on_save = {
                -- These options will be passed to conform.format()
                lsp_format = "fallback",
            },
        }
    end
}
