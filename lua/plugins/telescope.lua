local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>fs', 
	function()
		builtin.grep_string({ sreach = vim.fn.input("Search word >> ") } )
	end, 
	{ desc = 'Telescope live string search' });
vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Telescope live grep' })

return {
    'nvim-telescope/telescope.nvim',
}
