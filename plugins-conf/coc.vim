command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = ['coc-solargraph', 'coc-highlight', 'coc-python', 'coc-yaml', 'coc-html', 'coc-css', 'coc-json',  'coc-xml', 'coc-snippets', 'coc-tsserver', 'coc-prettier', 'coc-flutter', 'coc-explorer', 'coc-markdownlint', 'coc-db', 'coc-yank']
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

let g:coc_explorer_global_presets = {
      \   'floating': {
      \      'position': 'floating',
      \   },
      \   'floatingTop': {
      \     'position': 'floating',
      \     'floating-position': 'center-top',
      \   },
      \   'floatingLeftside': {
      \      'position': 'floating',
      \      'floating-position': 'left-center',
      \      'floating-width': 50,
      \   },
      \   'floatingRightside': {
      \      'position': 'floating',
      \      'floating-position': 'left-center',
      \      'floating-width': 50,
      \   },
      \   'simplify': {
      \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
      \   }
      \ }
