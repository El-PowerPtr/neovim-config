return{
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function () 
		local configs = require "nvim-treesitter.configs"
		configs.setup({
		  ensure_installed = { 	"c",
		  			"lua",
					"vim",
					"vimdoc",
					"css",
					"elixir",
					"haskell",
					"javascript",
					"html",
					"typescript",
					"java",
					"kotlin",
					"go",
					"sql",
					"cpp",
					"rust",
					"php",
					"prolog",
					"json",
					"yaml",
					"python",
					"elixir",
					"nasm",
					"graphql",
					"pascal",
					"r",
					"fortran",
					"xml",
					"prisma",
					"powershell",
					"bash",
					"git_config", 
					"git_rebase", 
					"gitattributes", 
					"gitcommit", 
					"gitignore", 
					"regex",
				},
		  sync_install = true,
		  highlight = { enable = true },
		  indent = { enable = true },  
		})
	end,
}
