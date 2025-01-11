return {
    'Olical/conjure',
    ft = { 'clojure' },
    vim.api.nvim_create_user_command('Repl', 'silent !start /b lein repl', {})
}
