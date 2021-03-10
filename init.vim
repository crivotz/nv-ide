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
" =============================================================================
" PLUGINS
" =============================================================================
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
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'romgrk/barbar.nvim'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kshenoy/vim-signature'
Plug 'yggdroot/indentline'
Plug 'airblade/vim-rooter'
Plug 'chaoren/vim-wordmotion'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/gv.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'haya14busa/is.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'rhysd/committia.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'dyng/ctrlsf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'moll/vim-node'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'alok/notational-fzf-vim'
Plug 'zinit-zsh/zplugin-vim-syntax'
Plug 'drzel/vim-line-no-indicator'
Plug 'liuchengxu/vista.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'AndrewRadev/tagalong.vim'
Plug 'jmckiern/vim-venter'
Plug 'voldikss/vim-floaterm'
Plug 'lambdalisue/suda.vim'
Plug 'psliwka/vim-smoothie'
Plug 'kovetskiy/vim-autoresize'
Plug 'andymass/vim-matchup'
Plug 'norcalli/nvim-colorizer.lua'
" =============================================================================
" COLORSCHEME
" =============================================================================
Plug 'gruvbox-community/gruvbox'
call plug#end()

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
set shortmess+=c
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

" =============================================================================
" PLUGINS CONFIGURATION
" =============================================================================
source ~/.nv-ide/plugins-conf/fzf.vim
source ~/.nv-ide/plugins-conf/custom_functions.vim
source ~/.nv-ide/plugins-conf/vista.vim
source ~/.nv-ide/plugins-conf/coc.vim
source ~/.nv-ide/plugins-conf/ctrlsf.vim
source ~/.nv-ide/plugins-conf/devdocs.vim
source ~/.nv-ide/plugins-conf/editorconfig.vim
source ~/.nv-ide/plugins-conf/vim-floaterm.vim
source ~/.nv-ide/plugins-conf/indentline.vim
source ~/.nv-ide/plugins-conf/netrw.vim
source ~/.nv-ide/plugins-conf/notational-fzf.vim
source ~/.nv-ide/plugins-conf/vim-gutentags.vim
source ~/.nv-ide/plugins-conf/vim-rooter.vim
source ~/.nv-ide/plugins-conf/vim-rubocop.vim
source ~/.nv-ide/plugins-conf/vim-signature.vim
source ~/.nv-ide/plugins-conf/vim-sneak.vim
source ~/.nv-ide/plugins-conf/vim-startify.vim

" =============================================================================
" PLUGINS LUA CONFIGURATION
" =============================================================================
luafile ~/.nv-ide/lua/plugins/galaxyline.lua
luafile ~/.nv-ide/lua/plugins/treesitter.lua
luafile ~/.nv-ide/lua/plugins/colorizer.lua

" =============================================================================
" GENERIC CONFIGURATION
" =============================================================================
source ~/.nv-ide/conf/highlight.vim
source ~/.nv-ide/conf/filetype.vim
source ~/.nv-ide/conf/keys.vim
