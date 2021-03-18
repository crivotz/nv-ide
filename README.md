    ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗  
    ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝  
    ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗  
    ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝  
    ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗  
    ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝  

Vim custom configuration, oriented for web developers (rails, ruby, php, html, css, SCSS, javascript).  
I use this repository mainly to keep track of the changes that I made on my Vim configuration.  
But I hope that it will be useful to other

Thanks to the developers of these plugins/color schemes

![nv-ide + startify](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/v-ide_screenshot.png)
![nv-ide + nvim-compe + nvimtree ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/v-ide_screenshot_1.png)
![v-ide + fzf + delta ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/v-ide_screenshot_2.png)
![v-ide + fzf + GH cli ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/v-ide_screenshot_3.png)
![v-ide + fzf + vista ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/v-ide_screenshot_5.png)

---

**SYNTAX**

Check [tree-sitter](https://github.com/tree-sitter/tree-sitter) for full list.  

**INSTALLATION**
```console
git clone git://github.com:crivotz/nv-ide.git ~/.nv-ide
cd ~/.config
ln -s ~/.nv-ide nvim
vim
:PlugInstall
```
**UPDATE**
```console
vim
:PlugUpdate
```
**DEPENDENCIES**

* NVim
* [Universal-ctags](https://github.com/universal-ctags/ctags) with JSON format
* [FZF](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern  
* [Prettier](https://prettier.io)
* Rippertag

**SUGGESTION**

* Font: [Fira Code Nerd fonts](https://github.com/ryanoasis/nerd-fonts)

**PLUGINS**  

* [tpope/vim-sensible](https://github.com/tpope/vim-sensible): sensible.vim: Defaults everyone can agree on  
* [tpope/vim-rails](https://github.com/tpope/vim-rails): rails.vim: Ruby on Rails power tools  
* [tpope/vim-abolish](https://github.com/tpope/vim-abolish): abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word  
* [tpope/vim-surround](https://github.com/tpope/vim-surround): surround.vim: quoting/parenthesizing made simple  
* [tpope/vim-bundler](https://github.com/tpope/vim-bundler): bundler.vim: Lightweight support for Ruby's Bundler  
* [tpope/vim-capslock](https://github.com/tpope/vim-capslock): capslock.vim: Software caps lock  
* [tpope/vim-repeat](https://github.com/tpope/vim-repeat): repeat.vim: enable repeating supported plugin maps with "."  
* [tpope/vim-endwise](https://github.com/tpope/vim-endwise): endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc  
* [tpope/vim-rvm](https://github.com/tpope/vim-rvm): rvm.vim: Switch Ruby versions from inside Vim  
* [tpope/vim-commentary](https://github.com/tpope/vim-commentary): commentary.vim: comment stuff out  
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch): dispatch.vim: Asynchronous build and test dispatcher  
* [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod): dadbod.vim: Modern database interface for Vim  
* [tpope/vim-jdaddy](https://github.com/tpope/vim-jdaddy): jdaddy.vim: JSON manipulation and pretty printing  
* [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb): rhubarb.vim: GitHub extension for fugitive.vim  
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive): fugitive.vim: A Git wrapper so awesome, it should be illegal  
* [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak): The missing motion for Vim 👟  
* [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags): A Vim plugin that manages your tag files  
* [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature): Plugin to toggle, display and navigate marks  
* [yggdroot/indentline](https://github.com/yggdroot/indentline): A vim plugin to display the indention levels with thin vertical lines  
* [airblade/vim-rooter](https://github.com/airblade/vim-rooter): Changes Vim working directory to project root.  
* [chaoren/vim-wordmotion](https://github.com/chaoren/vim-wordmotion): More useful word motions for Vim  
* [junegunn/vim-peekaboo](https://github.com/junegunn/vim-peekaboo): 👀 " / @ / CTRL-R  
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align): 🌻 A Vim alignment plugin  
* [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim): fzf ❤️ vim  
* [junegunn/fzf](https://github.com/junegunn/fzf): 🌸 A command-line fuzzy finder  
* [junegunn/gv.vim](https://github.com/junegunn/gv.vim): A git commit browser in Vim  
* [stsewd/fzf-checkout.vim](https://github.com/stsewd/fzf-checkout.vim): Manage branches and tags with fzf  
* [haya14busa/is.vim](https://github.com/haya14busa/is.vim): incremental search improved - successor of incsearch.vim  
* [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): True Sublime Text style multiple selections for Vim  
* [rhysd/committia.vim](https://github.com/rhysd/committia.vim): A Vim plugin for more pleasant editing on commit messages  
* [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons): Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more  
* [tmux-plugins/vim-tmux-focus-events](https://github.com/tmux-plugins/vim-tmux-focus-events): Make terminal vim and tmux work better together.  
* [dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim): An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2  
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips): UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips!  
* [honza/vim-snippets](https://github.com/honza/vim-snippets): vim-snipmate default snippets (Previously snipmate-snippets)  
* [moll/vim-node](https://github.com/moll/vim-node): Tools and environment to make Vim superb for developing with Node.js. Like Rails.vim for Node.  
* [mhinz/vim-startify](https://github.com/mhinz/vim-startify): 🔗 The fancy start screen for Vim.  
* [alok/notational-fzf-vim](https://github.com/alok/notational-fzf-vim): Notational velocity for vim.  
* [zinit-zsh/zplugin-vim-syntax](https://github.com/zinit-zsh/zplugin-vim-syntax): A Vim syntax definition for Zinit commands in any ft=zsh file  
* [liuchengxu/vista.vim](https://github.com/liuchengxu/vista.vim): 🌵 Viewer & Finder for LSP symbols and tags  
* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and vim splits  
* [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim): EditorConfig plugin for Vim  
* [jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggles between hybrid and absolute line numbers automatically  
* [AndrewRadev/tagalong.vim](https://github.com/AndrewRadev/tagalong.vim): Change an HTML(ish) opening tag and take the closing one along as well  
* [jmckiern/vim-venter](https://github.com/jmckiern/vim-venter): Vim plugin that horizontally centers the current window(s)  
* [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm): 🌟 Terminal manager for (neo)vim  
* [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim): 🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows  
* [psliwka/vim-smoothie](https://github.com/psliwka/vim-smoothie): Smooth scrolling for Vim done right🥤  
* [kovetskiy/vim-autoresize](https://github.com/kovetskiy/vim-autoresize): The dead-simple autoresize plugin for Vim.  
* [andymass/vim-matchup](https://github.com/andymass/vim-matchup): vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen replacement  
* [glepnir/galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim): neovim statusline plugin written in lua  
* [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim): A neovim tabline plugin.  
* [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua): The fastest Neovim colorizer.  
* [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): A file explorer tree for neovim written in lua  
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configurations for the Nvim LSP client  
* [ojroques/nvim-lspfuzzy](https://github.com/ojroques/nvim-lspfuzzy): A Neovim plugin to make the LSP client use FZF  
* [hrsh7th/nvim-compe](https://github.com/hrsh7th/nvim-compe): Auto completion plugin for nvim that written in Lua.  
* [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim): Pictograms for lsp completion items  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git signs written in pure lua  
* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): autopairs for neovim written by lua  
* [gruvbox-community/gruvbox](https://github.com/gruvbox-community/gruvbox): Retro groove color scheme for Vim - community maintained edition  
