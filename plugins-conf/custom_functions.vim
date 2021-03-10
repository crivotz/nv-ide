" =============================================================================
" CUSTOM FUNCTIONS
" =============================================================================

function RunWith (command)
  execute "w"
  execute "!clear;time " . a:command . " " . expand("%")
endfunction
