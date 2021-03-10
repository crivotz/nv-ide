let g:startify_files_number = 8
" let g:startify_session_autoload = 1
let g:startify_padding_left = 3
let g:webdevicons_enable_startify = 1
let g:startify_session_delete_buffers = 1 " delete all buffers when loading or closing a session, ignore unsaved buffers
let g:startify_session_remove_lines = ['setlocal', 'winheight'] " lines matching any of the patterns in this list, will be removed from the session file
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time
let g:startify_update_oldfiles = 1
let g:startify_change_to_dir = 1 " when opening a file or bookmark, change to its directory
let g:startify_fortune_use_unicode = 1 " beautiful symbols
" let g:startify_padding_left = 3 " the number of spaces used for left padding
let g:startify_session_sort = 1 " sort sessions by alphabet or modification time"
let g:startify_bookmarks = [
      \ {'d': '~/Dev'},
      \ {'w': '~/DevWeb'},
      \ {'c': '~/.config/nvim/init.vim'},
      \ {'s': '~/.config/nvim/coc-settings.json'},
      \ {'p': '~/.config/nvim/conf/vim-plug.vim'},
      \ {'z': '~/.zshrc'}
      \ ]
let g:startify_custom_header = [
      \' ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗',
      \' ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝',
      \' ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗  ',
      \' ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝  ',
      \' ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗',
      \' ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝',
      \ ]
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ["  Bookmarks"]      },
      \ { 'type': 'files',     'header': ["  MRU Files"]            },
      \ { 'type': 'dir',       'header': ["  MRU Files in ". getcwd()] },
      \ { 'type': 'commands',  'header': ["  Commands"]       },
      \ ]

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
