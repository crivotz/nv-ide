-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'windwp/nvim-autopairs'
  use 'AndrewRadev/tagalong.vim'
  use 'andymass/vim-matchup'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'
  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'romgrk/nvim-treesitter-context'

  -- Syntax
  use 'moll/vim-node'
  use 'zinit-zsh/zplugin-vim-syntax'
  use 'editorconfig/editorconfig-vim'
  use 'chrisbra/csv.vim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'

  -- Status Line and Bufferline
  use 'famiu/feline.nvim'
  use 'romgrk/barbar.nvim'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'fhill2/telescope-ultisnips.nvim'
  use { 'pwntester/octo.nvim', requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}} }

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Color
  use 'norcalli/nvim-colorizer.lua'

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'kdheepak/lazygit.nvim'
  use 'rhysd/committia.vim'

  -- Flutter
  use 'akinsho/flutter-tools.nvim'

  -- Registers
  use 'tversteeg/registers.nvim'

  -- Search and replace
  use 'windwp/nvim-spectre'
  use 'nacro90/numb.nvim'
  use 'haya14busa/is.vim'
  use 'dyng/ctrlsf.vim'

  -- Tim Pope docet
  use 'tpope/vim-sensible'
  use 'tpope/vim-rails'
  use 'tpope/vim-abolish'
  use 'tpope/vim-surround'
  use 'tpope/vim-bundler'
  use 'tpope/vim-capslock'
  use 'tpope/vim-repeat'
  use 'tpope/vim-endwise'
  use 'tpope/vim-rvm'
  use 'tpope/vim-commentary'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-dadbod'
  use 'tpope/vim-jdaddy'
  use 'tpope/vim-fugitive'

  -- Tmux
  use 'tmux-plugins/vim-tmux-focus-events'
  use 'christoomey/vim-tmux-navigator'

  -- Colorschema
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/sonokai'

  -- General Plugins
  use 'airblade/vim-rooter'
  use 'justinmk/vim-sneak'
  use 'ludovicchabant/vim-gutentags'
  use 'kshenoy/vim-signature'
  use 'chaoren/vim-wordmotion'
  use 'junegunn/vim-easy-align'
  use 'mhinz/vim-startify'
  use 'jeffkreeftmeijer/vim-numbertoggle'
  use 'jmckiern/vim-venter'
  use 'lambdalisue/suda.vim'
  use 'psliwka/vim-smoothie'
  use 'dstein64/nvim-scrollview'
  use 'npxbr/glow.nvim'

end)
