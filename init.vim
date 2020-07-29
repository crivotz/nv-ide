" =============================================================================
" NO COMPATIBILITY
" =============================================================================
set nocompatible

" =============================================================================
" LANGUAGE UI
" =============================================================================
language messages C
set langmenu=en_US.UTF-8

" =============================================================================
" VIM-PLUG
" =============================================================================
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug by yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finis_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kshenoy/vim-signature'
Plug 'yggdroot/indentline'
Plug 'airblade/vim-rooter'
Plug 'benmills/vimux'
Plug 'chaoren/vim-wordmotion'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-slash'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/committia.vim'
Plug 'rhysd/devdocs.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'dyng/ctrlsf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'alok/notational-fzf-vim'
Plug 'zinit-zsh/zplugin-vim-syntax'
Plug 'arcticicestudio/nord-vim'
Plug 'drzel/vim-line-no-indicator'
Plug 'liuchengxu/vista.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wincent/scalpel'
Plug 'AndrewRadev/tagalong.vim'
Plug 'jmckiern/vim-venter'
call plug#end()

" =============================================================================
" SET THE GUI COLOR SCHEME
" =============================================================================
set t_Co=256
if has("termguicolors")
  set termguicolors
  " set Vim-specific sequences for RGB colors
  if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif
color nord

" =============================================================================
" CHECK OS
" =============================================================================
if has('unix')
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set guifont=FuraCode\ Nerd\ Font\ Mono\:h11
    set rtp+=~/.zinit/plugins/junegunn---fzf
  else
    set guifont=FuraCode\ Nerd\ Font\ Mono\ 8
    set rtp+=~/.zinit/plugins/junegunn---fzf
  endif
elseif has('win32') || has('win64')
  behave mswin
  set guifont=Hack\:9
  au GUIEnter * simalt ~n
endif

" =============================================================================
" SETTINGS
" =============================================================================
set fillchars+=vert:.                     " Change vertical split character
set guioptions=aAce                       " GUI options
set showtabline=2
set so=10                                 " Row after cursor
set fileformat=unix                       " set fileformat
set tabstop=2                             " N space for tab
set mouse=a                               " Mouse enabled
set colorcolumn=+1                        " Highlight column 81
set backupcopy=yes
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
set undolevels=1000 						          " n of changes that can be undone
set spelllang=it                          " set default spell to it
set softtabstop=2
set signcolumn=yes
set shortmess+=c
set noshowmode                            " Don't dispay mode in command line
set number                                " Row number
set relativenumber                        " Relative number
set hidden                                " allow hidden buffer
set splitright                            " Open vertical splits to the right
set splitbelow                            " Open horizontal splits to the bottom
set wrapscan                              " Start search from the beginning
set nobackup                              " No backups
set nowritebackup                         " No backups
set noswapfile                            " No swap 
set noautowrite                           " no auto save on buffer switch
set noundofile                            " no undo files
set nofoldenable                          " Open all folds by default
set showcmd                               " Show command 
set showmatch                             " Show close bracket
set ignorecase                            " no case sensitive search patterns
set hlsearch                              " Highlight search results
set smartcase                             " Search with caps - override ignorecase
" set esckeys                               " cursor keys in I mode
set noerrorbells                          " do not use errorbells
set nojoinspaces                          " two spaces after a period on join
set title                                 " show window title
set cursorline
set nolist listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣

" jump to the last known cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Set cursor position
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn

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
hi! VertSplit gui=NONE guifg=NONE guibg=NONE
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" For list
hi NonText ctermfg=16 guifg=#EBCB8B
hi SpecialKey ctermfg=16 guifg=#EBCB8B
"Nord color for sneak
hi Sneak gui=bold guifg=#D8Dee9 guibg=#5E81AC
hi SneakScope  guifg=#2E3440 guibg=#EBCB8B
hi SneakLabelMask guifg=#5E81AC guibg=#5E81AC

" ============================================================================
" VISTA
" =============================================================================
let g:vista#renderer#enable_icon = 1
let g:vista#finders = ['fzf']
let g:vista_executive_for = {
      \ 'ruby': 'coc',
      \ }
let g:vista_fzf_preview = []

" =============================================================================
" FZF
" =============================================================================
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'rounded': v:false } }

" =============================================================================
" VIM-STARTIFY
" =============================================================================
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

" =============================================================================
" CTRLSF
" =============================================================================
let g:ctrlsf_ackprg = 'rg'
let g:ctrls_auto_preview = 1
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_auto_focus = {
      \ "at": "start"
      \ }

" =============================================================================
" NOTATIONAL VIM
" =============================================================================
let g:nv_search_paths = ['~/Note']

" =============================================================================
" NETRW
" =============================================================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 1
let g:netrw_alto = 0

" =============================================================================
" VIM-SIGNATURE
" =============================================================================
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

" =============================================================================
" COC
" =============================================================================
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = ['coc-solargraph', 'coc-highlight', 'coc-python', 'coc-yaml', 'coc-html', 'coc-css', 'coc-json',  'coc-xml', 'coc-snippets', 'coc-tsserver', 'coc-prettier', 'coc-flutter', 'coc-explorer', 'coc-markdownlint', 'coc-db']
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
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

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

" =============================================================================
" LIGHTLINE AND LIGHTLINE-BUFFERLINE
" =============================================================================
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ],
      \   'right':  [ ['lineinfo'],
      \             [ 'linenoindicator' ],
      \             [ 'rvm' ],
      \             [ 'fileformat' ],
      \             [ 'fileencoding' ],
      \             [ 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Lightlinegit',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'rvm': 'rvm#statusline',
      \   'filename': 'LightlineFilename',
      \   'readonly': 'LightLineReadonly',
      \   'currentfunction'  : 'CocCurrentFunction',
      \   'method'  : 'NearestMethodOrFunction',
      \   'mode'  : 'LightlineMode',
      \   'linenoindicator'  : 'LineNoIndicator',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'cocerror': 'LightLineCocError',
      \   'cocwarn': 'LightLineCocWarn',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'cocerror': 'error',
      \   'cocwarn' : 'warning',
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [['cocerror', 'cocwarn', 'currentfunction' ]]
      \ }
      \ }

function! LightlineMode()
  return &filetype ==# 'vista' ? 'VISTA' :
        \ &filetype ==# 'ctrlsf' ? 'CTRLSF' :
        \ &filetype ==# 'fugitive' ? 'FUGITIVE' :
        \ &filetype ==# 'fzf' ? 'FZF' :
        \ lightline#mode()
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFilename()
  let modified = &modified ? ' +' : ''
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:] . modified
  endif
  return expand('%') . modified
endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineCocError()
  let s:error_sign = get(g:, 'coc_status_error_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let errmsgs = []
  if get(info, 'error', 0)
    call add(errmsgs, s:error_sign . info['error'])
  endif
  return trim(join(errmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! LightLineCocWarn() abort
  let s:warning_sign = get(g:, 'coc_status_warning_sign')
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info)
    return ''
  endif
  let warnmsgs = []
  if get(info, 'warning', 0)
    call add(warnmsgs, s:warning_sign . info['warning'])
  endif
  return trim(join(warnmsgs, ' ') . ' ' . get(g:, 'coc_status', ''))
endfunction

function! Lightlinegit()
  let l:branch = fugitive#head()
  return l:branch ==# '' ? '' : ' ' . l:branch
endfunction


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd User CocDiagnosticChange call lightline#update()
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" =============================================================================
" VIM-HEXOKINASE
" =============================================================================
let g:Hexokinase_ftAutoload = ['*']
let g:Hexokinase_highlighters = ['sign_column']
" let g:Hexokinase_refreshEvents = ['BufWritePost']
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba']

" =============================================================================
" FILETYPE
" =============================================================================
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufNewFile,BufRead /tmp/mutt-* set filetype=mail
autocmd BufNewFile,BufRead /*.rasi setf css
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile=1
" autocmd FileType ruby,eruby let g:rubycomplete_use_bundler=1
" autocmd BufRead,BufNewFile *.md setlocal spell

" =============================================================================
" FUNCTION
" =============================================================================
function RunWith (command)
  execute "w"
  execute "!clear;time " . a:command . " " . expand("%")
endfunction

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

" =============================================================================
" INDENTLINE
" =============================================================================
" let g:indentLine_setColors = 0
let g:indentLine_char = '|'
let g:indentLine_fileTypeExclude = [ 'startify' ]
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '·'
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '·'

" =============================================================================
" VIM-RUBOCOP
" =============================================================================
let g:vimrubocop_keymap = 0
let g:vimrubocop_confi = '.rubocop.yml'

" =============================================================================
" VIM-ROOTER
" =============================================================================
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['.git', '.git/']

" =============================================================================
" DEVDOCS
" =============================================================================
let g:devdocs_filetype_map = {
      \   'ruby': 'rails',
      \   'javascript.js': 'jquery',
      \ }

" =============================================================================
" VIM-POLYGLOT
" =============================================================================
let g:polyglot_disabled = ['markdown']

" ============================================================================
" VIM-SNEAK
" =============================================================================

" case sensitivity
let g:sneak#use_ic_scs = 1

" clever repetition
let g:sneak#s_next = 1
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1
" let g:sneak#absolute_dir = 1

" target selection
let g:sneak#label = 1
let g:sneak#prompt = 'λ -> '
let g:sneak#label_esc = "\<CR>"
let g:sneak#target_labels = 'aoeuidhtnspyfgcrlqjkxbmwvzAOEUIDHTNSPYFGCRLQJKXBMWVZ'

" ============================================================================
" VIM-GUTENTAGS
" =============================================================================
set tags+=tags,.git/tags
let g:gutentags_enabled = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_resolve_symlinks = 1
let g:gutentags_ctags_tagfile = '.git/tags'
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_extra_args = ['--fields=+l']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_ctags_executable_ruby = 'ripper-tags'
let g:gutentags_ctags_extra_args = ['--ignore-unsupported-options', '--recursive']

" ============================================================================
" EDITORCONFIG
" =============================================================================
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" =============================================================================
"<F1> open help
nnoremap <F3> :set number! relativenumber!<CR>
nmap <F4> :set list! list?<CR>
nmap <silent><F7> :CocCommand explorer --width 80<CR>
nmap <silent><F6> :CocCommand explorer --preset floating<CR>
nmap <F8> :Vista<CR>
nmap <F9> :VenterToggle<CR>
autocmd FileType ruby nmap <F10> :call RunWith("ruby")<cr>
autocmd FileType json nmap <F10> :%!python -m json.tool<cr>
nmap <Leader>bda :bd <C-a> <CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>nm :Dispatch npm start<CR>
nmap <Leader>nv :NV<CR>
nmap <Leader>p :call fzf#vim#files('', fzf#vim#with_preview({'options': '--prompt ""'}, 'right:70%'))<CR>
nmap <Leader>r :Rg<CR>
nmap <Leader>tt :Rg todo<CR>
nmap <Leader>l :Lines 
nmap <Leader>h :History<CR>
nmap <Leader>tc :Colors<CR>
nmap <Leader>m :Marks<CR>
nmap <Leader>v :Vista finder<CR>
nmap <Leader>g :GFiles?<CR> 
nmap <Leader>gv :GV<CR> 
nmap <Leader>gg :20G<CR> 
nmap <Leader>xx :VimuxPromptCommand<CR>
nmap <silent> <Leader>sp :set spell!<CR>
nmap K <Plug>(devdocs-under-cursor)
nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordExec
nnoremap <C-F>t :CtrlSFToggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
