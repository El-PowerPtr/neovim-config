return {
    	"ThePrimeagen/harpoon",
    	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup{
			settings = {
				sync_on_ui = true,
			},
		}

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<leader>ah", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<leader>aj", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<leader>ak", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<leader>al", function() harpoon:list():select(4) end)

		vim.keymap.set("n", "<leader>rh", function() harpoon:list():remove_at(1) end)
		vim.keymap.set("n", "<leader>rj", function() harpoon:list():remove_at(2) end)
		vim.keymap.set("n", "<leader>rk", function() harpoon:list():remove_at(3) end)
		vim.keymap.set("n", "<leader>rl", function() harpoon:list():remove_at(4) end)

		vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end)
		vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end)
	end,
}
