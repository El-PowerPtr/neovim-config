return {
    	'nvim-telescope/telescope.nvim',
	config = function()
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
		vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

		vim.keymap.set("n", "<leader>h", function() harpoon:list():select(5) end)
		vim.keymap.set("n", "<leader>j", function() harpoon:list():select(6) end)
		vim.keymap.set("n", "<leader>k", function() harpoon:list():select(7) end)
		vim.keymap.set("n", "<leader>l", function() harpoon:list():select(8) end)


		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
