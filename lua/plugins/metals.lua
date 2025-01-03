return {
    "scalameta/nvim-metals",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local metals_config = require("metals").bare_config()

        metals_config.init_options.statusBarProvider = "on"

        metals_config.on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

            metals_config.settings = {
                serverVersion = "latest.snapshot",
                showImplicitArguments = true,
                showImplicitConversionsAndClasses = true,
                showInferredType = true,
                defaultBspToBuildTool = true,
                autoImportBuild = "all",
            }

            metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

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
            buf_set_keymap('n', '<C-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

            client.server_capabilities.document_formatting = true
        end

        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt", "sc", },
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end,

}
