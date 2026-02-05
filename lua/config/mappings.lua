-- <F1> help
vim.keymap.set('n', '<F3>', ':set nu! rnu!<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<F4>', ':set list! list?<CR>', {noremap = false, silent = true})
-- <F7> Yazi
vim.keymap.set('n', '<leader>nm', ':Dispatch npm start<CR>', {noremap = false, silent = true})
-- Note
vim.keymap.set('n', '<leader>tv', ":lua require('util.scratches').open_scratch_file()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>nt', ":lua require('util.scratches').open_scratch_file_floating()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>nn', ":lua NewNote()<CR>", {noremap = true, silent = false})
-- LSP
-- Use diagnostics in util
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {noremap = true, silent = true})
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {noremap = true, silent = true})
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {noremap = true, silent = true})
-- ROR
vim.keymap.set("n", "<Leader>or", ":! overmind restart<CR>", { silent = true })

