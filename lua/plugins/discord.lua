return {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    event = 'VeryLazy',
    config = function()
        require('cord').setup {
            timer = {
                interval = 1500,
                reset_on_idle = true,
                reset_on_change = false,
            },
            editor = {
                image = nil,
                client = 'neovim',
                tooltip = 'i use neovim btw 🗣️',
            }
        }
    end
}
