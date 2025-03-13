return {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    event = 'VeryLazy',
    config = function()
        require('cord').setup {
            timestamp = {
                reset_on_idle = true,
                reset_on_change = true,
            },
            editor = {
                image = nil,
                client = 'neovim',
                tooltip = 'i use neovim btw 🗣️',
            },
            idle = {
                timeout = 15000,
                ignore_focus = false,
                details = 'Jerking off',
            }

        }
    end
}
