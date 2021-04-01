" ============================================================================
" HIGHLIGHT
" =============================================================================
" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=NONE guibg=NONE
hi! StatusLineNC guifg=NONE guibg=NONE
" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=NONE guibg=NONE cterm=NONE
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" Gruvbox
" For list
hi NonText ctermfg=16 guifg=#FABD2F
hi SpecialKey ctermfg=16 guifg=#FBCB8B
"Gruvbox color for sneak
hi Sneak gui=bold guifg=#1d2021 guibg=#FABD2F
hi SneakScope  guifg=#1d2021 guibg=#FABD2F
hi SneakLabelMask guifg=#FABD2F guibg=#FABD2F
" Gruvbox floaterm
hi FloatermBorder guifg=#83a598
hi IndentBlanklineChar guifg=#3c3836 gui=nocombine
