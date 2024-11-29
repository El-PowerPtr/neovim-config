return {
    "mellow-theme/mellow.nvim",
    as = "mellow",
    confing = function()
        require("mellow").setup {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        }
        vim.cmd.colorscheme("mellow")
    end
}
