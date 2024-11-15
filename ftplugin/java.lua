local jdtls = require('jdtls')
-- Change or delete this if you don't depend on nvim-cmp for completions.
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Change jdtls_path to wherever you have your Eclipse Java development tools (JDT) Language Server downloaded to.
local jdtls_path = 'E:/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/'
local launcher_jar = vim.fn.glob (jdtls_path .. "plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar")
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

vim.o.tabstop = 4
vim.o.shiftwidth = 0

-- for completions
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)

local function get_config_dir()
  if vim.fn.has('linux') == 1 then
    return 'config_linux'
  elseif vim.fn.has('mac') == 1 then
    return 'config_mac'
  else
    return 'config_win'
  end
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  capabilities = capabilities,
  cmd = {
    -- This sample path was tested on Cygwin, a "unix-like" Windows environment.
    -- Please contribute to this Wiki if this doesn't work for another Windows
    -- environment like [Git for Windows](https://gitforwindows.org/) or PowerShell.
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", launcher_jar,
    "-configuration", vim.fs.normalize(jdtls_path .. '/' .. get_config_dir()),
    "-data", vim.fn.expand('~/.cache/jdtls-workspace/') .. workspace_dir
  },
  settings = {

        --['java.format.settings.url'] = vim.fn.expand("~/path /to /formatter.xml"),
        
        java = {
            runtimes = {
                {
                    name = "JavaSE-22",
                    path = "C:/Program Files/Java/jdk-22/"
                },
            },

            maven = {
                downloadSources = true,
            },

            eclipse = {
                downloadSources = true,
            },

            gradle = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            signatureHelp = { enabled = true },
            format = {
                enabled = true,
            -- Formatting works by default, but you can refer to a specific file/URL if you choose
            -- settings = {
            --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
            --   profile = "GoogleStyle",
            -- },
            },
            completion = {
                favoriteStaticMembers = {},
                importOrder = {
                  "java",
                  "javax",
                  "com",
                  "org",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
    },

  root_dir = vim.fs.dirname(vim.fs.find({'gradlew, mvnw, gradle.build, pom.xml', '.git' }, { upward = true })[1]),
  init_options = {
    -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#extended-client-capabilities
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
  on_attach = function(_, bufnr)
    -- https://github.com/mfussenegger/dotfiles/blob/833d634251ebf3bf7e9899ed06ac710735d392da/vim/.config/nvim/ftplugin/java.lua#L88-L94
    local opts = { silent = true, buffer = bufnr }
    vim.keymap.set('n', "<leader>O", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
    -- Should 'd' be reserved for debug?
    vim.keymap.set('n', "<leader>tc", jdtls.test_class, opts)
    vim.keymap.set('n', "<leader>tn", jdtls.test_nearest_method, opts)
    vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
    vim.keymap.set('v', '<leader>rm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
      { desc = 'Extract method', buffer = bufnr })
    vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })
  end
}

jdtls.start_or_attach(config)
