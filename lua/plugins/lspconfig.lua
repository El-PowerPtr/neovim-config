return {
    "neovim/nvim-lspconfig",
    config = function()
        require "mason-lspconfig"
        local lspconfig = require "lspconfig"
        local servers = {
            "ruff",
            "emmet_language_server",
            "jedi_language_server",
            "r_language_server",
            "lua_ls",
            "gradle_ls",
            --"gopls",
            --"jdtls",
            "elixirls",
            "kotlin_language_server",
            "ts_ls",
            "metals",
            "hls",
            "html",
            "eslint",
            "sqls",
            "clangd",
            "rust_analyzer",
            "jsonls",
            "fortls",
            "clojure_lsp",
        }

        local on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

            local opts = { noremap = true, silent = true }

            buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
            buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
            buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
            buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
            buf_set_keymap('n', '<leader>vn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            buf_set_keymap('n', '<leader>1', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

            client.server_capabilities.document_formatting = true
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for _, server in ipairs(servers) do
            lspconfig[server].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end

        lspconfig.hls.setup {
            filetypes = { "haskell", "lhaskell", "cabal" },
            cmd = {
                "haskell-language-server-wrapper",
                "--lsp",
            },
            settings = {
                haskell = {
                    formattingProvider = "ormulu",
                }
            }
        }

        lspconfig.basedpyright.setup {
            settings = {
                jedi = {
                    disableOrganizeImports = true, -- Using Ruff
                },
                python = {
                    analysis = {
                        ignore = { '*' }, -- Using Ruff
                        typeCheckingMode = 'on',
                    },
                },
            },
        }

        lspconfig.lua_ls.setup {
            cmd = { "C:/Users/trabajo/AppData/Local/nvim-data/mason/packages/lua-language-server/bin/lua-language-server" },
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "Lua 5.1",
                        path = "C:/Program Files (x86)/Lua/5.1",
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files and plugins
                        library = { vim.env.VIMRUNTIME },
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        lspconfig.gopls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
        }
    end
}
