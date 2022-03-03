<p align="center">
  <img src="https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/NV-IDE.svg?raw=true"/>
</p>

[Neovim](https://neovim.io/) LUA configuration, oriented for web developers (rails, ruby, php, html, css, SCSS, javascript).  
I use this repository mainly to keep track of the changes that I made on my Neovim configuration, but I hope that it will be useful to other  
The project is constantly changing  
You can find old no-lua and coc version under branch `old_coc_version`

Thanks to the developers of these plugins/color schemes

![nv-ide + startify](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_0.png)
![nv-ide + nvim-compe + nvimtree + mini-map ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_1.png)
![nv-ide + telescope ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_2.png)
![nv-ide + telescope + delta ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_3.png)
![nv-ide + telescope + treesitter ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_4.png)
![nv-ide + lazygit ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_5.png)
![nv-ide + telescope + Octo ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_6.png)

---

**SYNTAX**

Check [tree-sitter](https://github.com/tree-sitter/tree-sitter) for full list.  

**INSTALLATION**
```console
git clone git@github.com:crivotz/nv-ide.git ~/.nv-ide
cd ~/.config
ln -s ~/.nv-ide nvim
nvim
:PackerInstall
:PackerSync
```
**UPDATE**
```console
nvim
:PackerUpdate
:PackerSync
```
**DEPENDENCIES**

* NVim
* [Universal-ctags](https://github.com/universal-ctags/ctags) with JSON format
* [FZF](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern  
* Ripper-tags
* Needed LSP, show `lsp/init.lua`
* Glow, you can install it with :Glowinstall
* [code-minimap](https://github.com/wfxr/code-minimap) for minimap  
* [prettierd](https://github.com/fsouza/prettierd) for formatter.nvim  

**SUGGESTION**

* Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
* [dot_files](https://github.com/crivotz/dot_files)

**PLUGINS**  

* [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim): A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config  
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configurations for the Nvim LSP client  
* [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim): vscode-like pictograms for neovim lsp completion items  
* [weilbith/nvim-code-action-menu](https://github.com/weilbith/nvim-code-action-menu): Pop-up menu for code actions to show meta-information and diff preview  
* [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in Lua.  
* [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): nvim-cmp source for neovim builtin LSP client  
* [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer): nvim-cmp source for buffer words  
* [hrsh7th/cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip): nvim-cmp source for vim-vsnip  
* [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip): Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.  
* [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path): nvim-cmp source for path  
* [hrsh7th/cmp-calc](https://github.com/hrsh7th/cmp-calc): nvim-cmp source for math calculation  
* [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline): nvim-cmp source for vim's cmdline  
* [ray-x/cmp-treesitter](https://github.com/ray-x/cmp-treesitter): cmp source for treesitter  
* [lukas-reineke/cmp-rg](https://github.com/lukas-reineke/cmp-rg): ripgrep source for nvim-cmp  
* [quangnguyen30192/cmp-nvim-tags](https://github.com/quangnguyen30192/cmp-nvim-tags): tags sources for nvim-cmp  
* [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets): Set of preconfigured snippets for different languages.  
* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): autopairs for neovim written by lua  
* [AndrewRadev/tagalong.vim](https://github.com/AndrewRadev/tagalong.vim): Change an HTML(ish) opening tag and take the closing one along as well  
* [andymass/vim-matchup](https://github.com/andymass/vim-matchup): vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [p00f/nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow): Rainbow parentheses for neovim using tree-sitter. Also at https://sr.ht/~p00f/nvim-ts-rainbow  
* [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Indent guides for Neovim  
* [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring): Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.  
* [romgrk/nvim-treesitter-context](https://github.com/romgrk/nvim-treesitter-context): Show code context  
* [SmiteshP/nvim-gps](https://github.com/SmiteshP/nvim-gps): Simple statusline component that shows what scope you are working inside  
* [moll/vim-node](https://github.com/moll/vim-node): Tools and environment to make Vim superb for developing with Node.js. Like Rails.vim for Node.  
* [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim): EditorConfig plugin for Vim  
* [chrisbra/csv.vim](https://github.com/chrisbra/csv.vim): A Filetype plugin for csv files  
* [npxbr/glow.nvim](https://github.com/npxbr/glow.nvim): A markdown preview directly in your neovim.  
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align): 🌻 A Vim alignment plugin  
* [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim):   
* [zdharma-continuum/zinit-vim-syntax](https://github.com/zdharma-continuum/zinit-vim-syntax): A Vim syntax definition for Zinit commands in any ft=zsh file  
* [rust-lang/rust.vim](https://github.com/rust-lang/rust.vim): Vim configuration for Rust.  
* [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons): Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more  
* [famiu/feline.nvim](https://github.com/famiu/feline.nvim): A minimal, stylish and customizable statusline for Neovim written in Lua  
* [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim): The neovim tabline plugin.  
* [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim): [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Find, Filter, Preview, Pick. All lua, all the time.  
* [nvim-telescope/telescope-fzy-native.nvim](https://github.com/nvim-telescope/telescope-fzy-native.nvim): FZY style sorter that is compiled  
* [nvim-telescope/telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim):   
* [pwntester/octo.nvim](https://github.com/pwntester/octo.nvim): Edit and review GitHub issues and pull requests from the comfort of your favorite editor  
* [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): A file explorer tree for neovim written in lua  
* [crivotz/nvim-colorizer.lua](https://github.com/crivotz/nvim-colorizer.lua): The fastest Neovim colorizer.  
* [lpinilla/vim-codepainter](https://github.com/lpinilla/vim-codepainter): A plugin for Vim to color different parts of code making the use of Text Properties  
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers  
* [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim): Plugin for calling lazygit from within neovim.  
* [rhysd/committia.vim](https://github.com/rhysd/committia.vim): A Vim plugin for more pleasant editing on commit messages  
* [tversteeg/registers.nvim](https://github.com/tversteeg/registers.nvim): 📑 Neovim plugin to preview the contents of the registers  
* [AckslD/nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua): Clipboard manager neovim plugin with telescope integration  
* [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim): Peek lines just when you intend  
* [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim): A text searching plugin mimics Ctrl-Shift-F on Sublime Text 2  
* [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens): Hlsearch Lens for Neovim  
* [ggandor/lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim): 🌌 Next-generation motion plugin using incremental input processing, allowing for unparalleled speed with minimal cognitive effort  
* [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon):   
* [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim): Smooth scrolling neovim plugin written in lua  
* [dstein64/nvim-scrollview](https://github.com/dstein64/nvim-scrollview): 📜📶 A Neovim plugin that displays interactive vertical scrollbars.  
* [chaoren/vim-wordmotion](https://github.com/chaoren/vim-wordmotion): More useful word motions for Vim  
* [fedepujol/move.nvim](https://github.com/fedepujol/move.nvim): Gain the power to move lines and blocks and auto-indent them!  
* [tpope/vim-sensible](https://github.com/tpope/vim-sensible): sensible.vim: Defaults everyone can agree on  
* [tpope/vim-rails](https://github.com/tpope/vim-rails): rails.vim: Ruby on Rails power tools  
* [tpope/vim-abolish](https://github.com/tpope/vim-abolish): abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word  
* [tpope/vim-surround](https://github.com/tpope/vim-surround): surround.vim: Delete/change/add parentheses/quotes/XML-tags/much more with ease  
* [tpope/vim-bundler](https://github.com/tpope/vim-bundler): bundler.vim: Lightweight support for Ruby's Bundler  
* [tpope/vim-capslock](https://github.com/tpope/vim-capslock): capslock.vim: Software caps lock  
* [tpope/vim-repeat](https://github.com/tpope/vim-repeat): repeat.vim: enable repeating supported plugin maps with "."  
* [tpope/vim-endwise](https://github.com/tpope/vim-endwise): endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc  
* [tpope/vim-rvm](https://github.com/tpope/vim-rvm): rvm.vim: Switch Ruby versions from inside Vim  
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch): dispatch.vim: Asynchronous build and test dispatcher  
* [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod): dadbod.vim: Modern database interface for Vim  
* [tpope/vim-jdaddy](https://github.com/tpope/vim-jdaddy): jdaddy.vim: JSON manipulation and pretty printing  
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive): fugitive.vim: A Git wrapper so awesome, it should be illegal  
* [tpope/vim-commentary](https://github.com/tpope/vim-commentary): commentary.vim: comment stuff out  
* [github/copilot.vim](https://github.com/github/copilot.vim): Neovim plugin for GitHub Copilot  
* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and vim splits  
* [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material): Gruvbox with Material Palette  
* [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags): A Vim plugin that manages your tag files  
* [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify): A fancy, configurable, notification manager for NeoVim  
* [airblade/vim-rooter](https://github.com/airblade/vim-rooter): Changes Vim working directory to project root.  
* [mhinz/vim-startify](https://github.com/mhinz/vim-startify): 🔗 The fancy start screen for Vim.  
* [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim): a lua powered greeter like vim-startify / dashboard-nvim  
* [jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggles between hybrid and absolute line numbers automatically  
* [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim): 🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows  
* [numtostr/FTerm.nvim](https://github.com/numtostr/FTerm.nvim): 🔥 No-nonsense floating terminal plugin for neovim 🔥  
* [wfxr/minimap.vim](https://github.com/wfxr/minimap.vim): 📡 Blazing fast minimap / scrollbar for vim, powered by code-minimap written in Rust.  
* [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim): ✅ Highlight, list and search todo comments in your projects  
* [luukvbaal/stabilize.nvim](https://github.com/luukvbaal/stabilize.nvim): Neovim plugin to stabilize window open/close events.  
