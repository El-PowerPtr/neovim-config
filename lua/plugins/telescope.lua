return {
    	'nvim-telescope/telescope.nvim',
	config = function()
		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.find_files, { desc = 'Telescope git files' })
		vim.keymap.set('n', '<leader>fo', builtin.find_files, { desc = 'Telescope old files' })
		vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end,
}
