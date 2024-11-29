return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = false,
            update_cwd = true,
            update_focused_file = {
                enable = true,
                update_cwd = false,
            },
            view = {
                side = "right",
                width = 25,
            },
            renderer = {
            },
            git = {
                enable = false,
                ignore = true,
            },
            filesystem_watchers = {
                enable = true,
            },
            actions = {
                open_file = {
                    resize_window = true,
                },
            },
        }
    end,
}
