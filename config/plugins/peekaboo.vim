" function! CreateCenteredFloatingWindow()
"   let width = float2nr(&columns * 0.6)
"   let height = float2nr(&lines * 0.6)
"   let top = ((&lines - height) / 2) - 1
"   let left = (&columns - width) / 2
"   let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

"   let top = "╭" . repeat("─", width - 2) . "╮"
"   let mid = "│" . repeat(" ", width - 2) . "│"
"   let bot = "╰" . repeat("─", width - 2) . "╯"
"   let lines = [top] + repeat([mid], height - 2) + [bot]
"   let s:buf = nvim_create_buf(v:false, v:true)
"   call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
"   call nvim_open_win(s:buf, v:true, opts)
"   set winhl=Normal:Floating
"   let opts.row += 1
"   let opts.height -= 2
"   let opts.col += 2
"   let opts.width -= 4
"   call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
"   au BufWipeout <buffer> exe 'bw '.s:buf
" endfunction

" let g:peekaboo_window="call CreateCenteredFloatingWindow()"
