return {
    'mfussenegger/nvim-lint',
    config = function()
        local nvimlint = require 'lint'
        nvimlint.linters_by_ft = {
            python = { 'mypy' },
        }
    end
}
