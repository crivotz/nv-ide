-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "wd", ":windo diffthis<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>or", ":! overmind restart<CR>", { silent = true })
