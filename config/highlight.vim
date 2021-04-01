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
hi NonText ctermfg=16 guifg=#d8a657
hi SpecialKey ctermfg=16 guifg=#e1bb7e
"Gruvbox color for sneak
hi Sneak gui=bold guifg=#282828 guibg=#d8a657
hi SneakScope  guifg=#282828 guibg=#d8a657
hi SneakLabelMask guifg=#d8a657 guibg=#d8a657
" Gruvbox floaterm
hi FloatermBorder guifg=#7daea3
hi IndentBlanklineChar guifg=#3c3836 gui=nocombine
