-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- FIX: Check
-- vim.api.nvim_create_autocmd([[
-- autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
-- autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
-- " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
-- " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
-- " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
-- " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
-- " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
-- " autocmd FileType php set omnifunc=phpcomplete#CompletePHP
-- " autocmd BufRead,BufNewFile *.md setlocal spell
-- ]], true)

vim.api.nvim_create_autocmd("User", {
  pattern = "OilEnter",
  callback = vim.schedule_wrap(function(args)
    local oil = require("oil")
    if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      oil.open_preview()
    end
  end),
})
