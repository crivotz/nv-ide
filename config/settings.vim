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
" SET TRUECOLORS
" =============================================================================
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:gruvbox_italic=1
set bg=dark
color gruvbox

" =============================================================================
" CHECK OS
" =============================================================================
if has('unix')
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set guifont=FuraCode\ Nerd\ Font\ Mono\:h11
  else
    set guifont=FuraCode\ Nerd\ Font\ Mono\ 8
  endif
elseif has('win32') || has('win64')
  behave mswin
  set guifont=Hack\:9
  au GUIEnter * simalt ~n
endif

" =============================================================================
" SETTINGS
" =============================================================================
set fillchars+=vert:\                      " Change vertical split character
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
set shortmess-=S
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
set lazyredraw
set nolist listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣

" jump to the last known cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Set cursor position
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn
" Highlight yanked text
au TextYankPost * lua vim.highlight.on_yank {on_visual = false}
