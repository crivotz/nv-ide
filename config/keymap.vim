nnoremap                   <F3> :set number! relativenumber!<CR>
nmap                       <F4> :set list! list?<CR>
nmap       <silent>        <F7> :NvimTreeToggle<CR>
nmap                       <F9> :VenterToggle<CR>
autocmd FileType ruby nmap <F10> :call RunWith("ruby")<cr>
autocmd FileType json nmap <F10> :%!python -m json.tool<cr>
nmap                       <Leader>nm :Dispatch npm start<CR>
" Buffers
nmap                       <Leader>bda :BufferCloseAllButCurrent<CR>
nmap                       <Leader>bn :bnext<CR>
nmap                       <Leader>bp :bprevious<CR>
" Fugitive
nmap                       <Leader>gf :20G<CR>
" Devdocs
nmap                       K <Plug>(devdocs-under-cursor)
" Ctrlsf
nmap                       <C-F>f <Plug>CtrlSFPrompt
vmap                       <C-F>f <Plug>CtrlSFVwordExec
nmap                       <C-F>n <Plug>CtrlSFCwordExec
nnoremap                   <C-F>t :CtrlSFToggle<CR>
" Easy-align
xmap                       ga <Plug>(EasyAlign)
nmap                       ga <Plug>(EasyAlign)
" Vim-sneak
map                        f <Plug>Sneak_f
map                        F <Plug>Sneak_F
map                        t <Plug>Sneak_t
map                        T <Plug>Sneak_T
" LSP
nnoremap <silent> <space>, <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <space>; <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <space>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <space>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <space>h <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <space>m <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <space>r <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <space>s <cmd>lua vim.lsp.buf.document_symbol()<CR>
" Spectre
nnoremap <leader>S :lua require('spectre').open()<CR>
" search current word
vnoremap <leader>S :lua require('spectre').open_visual()<CR>
nnoremap <leader>Sw viw:lua require('spectre').open_visual()<CR>
" search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" Lazygit
nmap                       <Leader>gg :LazyGit<CR>
" Telescope
nnoremap <leader>r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>bb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>m <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>t <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>p <cmd>lua require('plugins.telescope').project_files()<cr>
nnoremap <leader>c <cmd>lua require('plugins.telescope').my_git_commits()<cr>
nnoremap <leader>g <cmd>lua require('plugins.telescope').my_git_status()<cr>
nnoremap <leader>b <cmd>lua require('plugins.telescope').my_git_bcommits()<cr>
nnoremap <leader>gc :Octo issue create<cr>
nnoremap <leader>i :Octo issue list<cr>
" FZF
nmap                       <Leader>nv :NV<CR>
" nmap      <silent>         <Leader>p :call fzf#vim#files('', fzf#vim#with_preview({'options': '--prompt "λ -> "'}))<CR>
" nmap                       <Leader>r :Rg<CR>
" nmap                       <Leader>bb :Buffers<CR>
" nmap                       <Leader>m :Marks<CR>
" nmap      <silent>         <Leader>g :GFiles?<CR>
