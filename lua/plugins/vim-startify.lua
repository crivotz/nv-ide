vim.g.startify_files_number = 8
vim.g.startify_padding_left = 3
vim.g.webdevicons_enable_startify = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_session_sort = 1
vim.g.startify_update_oldfiles = 1
vim.g.startify_change_to_dir = 1
vim.g.startify_fortune_use_unicode = 1
vim.api.nvim_exec(
'let startify_bookmarks = [ {\'d\': \'~/Dev\'}, {\'w\': \'~/DevWeb\'}, {\'c\': \'~/.config/nvim/init.lua\'}, {\'p\': \'~/.config/nvim/lua/plugins.lua\'}, {\'z\': \'~/.zshrc\'}]',
true
)
vim.g.startify_custom_header = {
  '    ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗',
  '    ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝',
  '    ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗  ',
  '    ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝  ',
  '    ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗',
  '    ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝'
}
vim.api.nvim_exec(
'let startify_lists = [ { \'type\': \'bookmarks\', \'header\': [\'  Bookmarks\']      }, { \'type\': \'files\',     \'header\': [\'  MRU Files\']            }, { \'type\': \'dir\',       \'header\': [\'  MRU Files in \'. getcwd()] }, { \'type\': \'commands\',  \'header\': [\'  Commands\'] } ]',
true
)
vim.cmd([[
function! StartifyEntryFormat()
return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])
