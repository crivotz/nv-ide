vim.api.nvim_set_keymap('n', '<F3>', ':set number! relativenumber!<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<F4>', ':set list! list?<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', ':VenterToggle<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>nm', ':Dispatch npm start<CR>', {noremap = false, silent = false})
-- Buffers
vim.api.nvim_set_keymap('n', '<leader>bda', ':BufferCloseAllButCurent<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprevious<CR>', {noremap = false, silent = false})
-- Fugitive
vim.api.nvim_set_keymap('n', '<leader>gf', ':20G<CR>', {noremap = false, silent = false})
-- Ctrlsf
vim.api.nvim_set_keymap('n', '<C-F>f', '<Plug>CtrlSFPrompt', {noremap = false, silent = false})
vim.api.nvim_set_keymap('v', '<C-F>f', '<Plug>CtrlSFVwordExec', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<C-F>n', '<Plug>CtrlSFCwordExec', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<C-F>t', ':CtrlSFToggle<CR>', {noremap = true, silent = false})
-- Easy-align
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
-- Vim-sneak
vim.api.nvim_set_keymap('n', 'f', '<Plug>Sneak_f', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'F', '<Plug>Sneak_F', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 't', '<Plug>Sneak_t', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'T', '<Plug>Sneak_T', {noremap = false, silent = false})
-- LSP
vim.api.nvim_set_keymap('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.diagnostic.code_action()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true, silent = true})
-- Spectre
vim.api.nvim_set_keymap('n', '<leader>S', '<cmd>lua require('spectre').open()<CR>', {noremap = true, silent = false})
-- search current word
vim.api.nvim_set_keymap('v', '<leader>S', '<cmd>lua require('spectre').open_visual()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>Sw', 'viw<cmd>lua require('spectre').open_visual()<CR>', {noremap = true, silent = false})
-- search in current file
vim.api.nvim_set_keymap('n', '<leader>sp', 'viw<cmd>lua require('spectre').open_file_search()<CR>', {noremap = true, silent = false})
-- Lazygit
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', {noremap = false, silent = false})
-- Telescope
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua require('telescope.builtin').live_grep()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>lua require('telescope.builtin').buffers()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua require('telescope.builtin').marks()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua require('telescope.builtin').treesitter()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua require('telescope.builtin').project_files()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua require('telescope.builtin').my_git_commits()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua require('telescope.builtin').my_git_status()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require('telescope.builtin').my_git_bcommits()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>lua require('telescope.builtin').my_note()<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Octo issue create<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>i', ':Octo issue list<CR>', {noremap = true, silent = false})
