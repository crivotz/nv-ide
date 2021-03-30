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
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kshenoy/vim-signature'
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
Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'dyng/ctrlsf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'moll/vim-node'
Plug 'mhinz/vim-startify'
Plug 'alok/notational-fzf-vim'
Plug 'zinit-zsh/zplugin-vim-syntax'
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
Plug 'chrisbra/csv.vim'
" LUA
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
Plug 'p00f/nvim-ts-rainbow'
Plug 'akinsho/flutter-tools.nvim'
" =============================================================================
" COLORSCHEME
" =============================================================================
Plug 'sainnhe/gruvbox-material'
call plug#end()
