let g:rubycomplete_buffer_loading=1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global=1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd BufRead,BufNewFile *.md setlocal spell
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = {
      \ 'default': [
      \   {'complete_items': ['lsp', 'tags', 'snippet', 'buffers', 'ts', 'path']},
      \ ]}

augroup EnableAutocomplete
  autocmd!
  autocmd BufEnter * lua require'completion'.on_attach()
augroup END
