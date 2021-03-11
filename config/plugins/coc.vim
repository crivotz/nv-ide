command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
      \ 'coc-solargraph',
      \ 'coc-highlight',
      \ 'coc-python',
      \ 'coc-yaml',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-xml',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-flutter',
      \ 'coc-markdownlint',
      \ 'coc-db',
      \ 'coc-yank'
      \ ]
autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_status_error_sign = ' '
let g:coc_status_warning_sign = ' '
