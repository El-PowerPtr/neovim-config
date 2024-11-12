vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set({ "n", "v" },"<leader>p", "\"*p", {remap = true})
vim.keymap.set({ "n", "v" },"<leader-Shift>P", "\"*P", {remap = true})
vim.keymap.set({ "n", "v" },"<leader>y", "\"*y", {remap = true})
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

