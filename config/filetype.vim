" =============================================================================
" FILETYPE
" =============================================================================
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
autocmd BufNewFile,BufRead /*.rasi setf css

" =============================================================================
" SUBTYPES
" =============================================================================
" Ruby
augroup ruby_subtypes
  autocmd!
  autocmd BufNewFile,BufRead *.pdf.erb let b:eruby_subtype='html'
  autocmd BufNewFile,BufRead *.pdf.erb set filetype=eruby
augroup END

" Jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
