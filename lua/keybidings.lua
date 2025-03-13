local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "ñ"

vim.keymap.set({ "n", "v" }, "<leader>p", "\"*p", { remap = true })
vim.keymap.set({ "n", "v" }, "<leader-Shift>P", "\"*P", { remap = true })
vim.keymap.set({ "n", "v" }, "<leader>y", "\"*y", { remap = true })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

vim.keymap.set("n", "<leader>H", ":split<CR><C-w>j:term<CR>", opts)
vim.keymap.set("n", "<leader>V", ":vsplit<CR><C-w>l:term<CR>", opts)

--show lsp diagnostics
vim.keymap.set('n', '<leader>ds', vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<leader>rn", ":set rnu!<CR>:set nu!<CR>", { desc = "toggle relative number" })

vim.keymap.set("n", "<esc>", ":noh<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts)

vim.keymap.set("n", "<C-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<C-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", opts)
vim.keymap.set("n", "<C-x>", ":tabclose<CR>", opts)
vim.keymap.set("n", "<C-A>h", ":tabprevious<CR>", opts)
vim.keymap.set("n", "<C-A>l", ":tabNext<CR>", opts)
