return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    config = function()
        local luasnip = require "luasnip"

        require("luasnip.loaders.from_vscode").lazy_load()

        vim.keymap.set({ 'i', 's' }, '<Tab>', function()
           if vim.snippet.active({ direction = 1 }) then
             return '<cmd>lua vim.snippet.jump(1)<cr>'
           else
             return '<Tab>'
           end
         end, { expr = true })

        vim.keymap.set({ 'i', 's' }, '<Tab>', function()
           if vim.snippet.active({ direction = 1 }) then
             return '<cmd>lua vim.snippet.jump(1)<cr>'
           else
             return '<Tab>'
           end
         end, { expr = true })

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end,
        {silent = true})

        luasnip.config.set_config{
            region_check_events = { 'InsertEnter' },
            enable_autosnippets = true,
       }
    end
}
