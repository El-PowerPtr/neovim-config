return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		local mason_lsp = require "mason-lspconfig"
		mason_lsp.setup{
			automatic_instalation = true,
			ensure_installed = {
				"ruff",
				"pyright",
				"lua_ls",
				"emmet_language_server",
				"hls",
				"html",
				"eslint",
				"sqls",
				"clangd",
				"gopls",
				"rust_analyzer",
				"jsonls",
				"fortls",
			},
		}
	end
}
