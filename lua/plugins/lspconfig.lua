return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require "lspconfig"
		local servers = {
			"pyright",
			"emmet_language_server",
            --"lua_ls",
            --"gopls",
            --"jdtls",
			"hls",
			"html",
			"eslint",
			"sqls",
			"clangd",
			"rust_analyzer",
			"jsonls",
			"fortls",
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
                buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
                buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                client.server_capabilities.document_formatting = true
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for _, server in ipairs(servers) do
           lspconfig[server].setup{
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end

        lspconfig.lua_ls.setup{
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "lua-language-server" },
            settings = {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                  version = "Lua 5.1",
                  path = vim.split(package.path, ";"),
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
