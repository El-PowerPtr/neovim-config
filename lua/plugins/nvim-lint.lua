return {
    'mfussenegger/nvim-lint',
    config = function()
        local nvimlint = require 'lint'
        nvimlint.linters_by_ft = {
            haskell = { 'hlint' },
        }
        vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
            callback = function()
                nvimlint.try_lint()
            end
        })
    end
}
