return {
    	"ThePrimeagen/harpoon",
    	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup{
			settings = {
				save_on_toggle = true,
				sync_on_ui = true,
			},
		}

		vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end)

		vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end)
		vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end)
	end,
}
