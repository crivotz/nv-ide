<p align="center">
  <img src="https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/NV-IDE.svg?raw=true"/>
</p>

[Neovim](https://neovim.io/) LUA configuration, oriented for web developers (rails, ruby, php, html, css, SCSS, javascript).  
I use this repository mainly to keep track of the changes that I made on my Neovim configuration, but I hope that it will be useful to other  
The project is constantly changing  
You can find old no-lua and coc version under branch `old_coc_version`
You can find old packer version under branch `old_packer`

Thanks to the developers of these plugins/color schemes

![nv-ide + startify](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_0.png)
![nv-ide + nvim-compe + nvimtree ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_1.png)
![nv-ide + telescope ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_2.png)
![nv-ide + which-key ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_3.png)
![nv-ide + lazygit ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_4.png)
![nv-ide + noice ](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_5.png)

---

**SYNTAX**

Check [tree-sitter](https://github.com/tree-sitter/tree-sitter) for full list.  

**INSTALLATION**
```console
git clone --depth 1 https://github.com/crivotz/nv-ide.git ~/.nv-ide
cd ~/.config
ln -s ~/.nv-ide nvim
nvim
```
**DEPENDENCIES**

* Neovim
* [Universal-ctags](https://github.com/universal-ctags/ctags) with JSON format
* [FZF](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern  
* [Ripper-tags](https://github.com/tmm1/ripper-tags)
* [prettierd](https://github.com/fsouza/prettierd) for formatter.nvim install via Mason `MasonInstall prettierd`
* Needed DAP, show `lua/plugins/nvim-dap.lua` install via Mason for `node` with `MasonInstall node-debug2-adapter`
* Needed LSP, show `lua/lsp/init.lua` installed automatically with Mason
* Terminal that supports ligatures for proper representation

**SUGGESTION**

* Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
* [dot_files](https://github.com/crivotz/dot_files)

**PLUGINS.LUA**  

* [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim): 🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.  
* [loctvl842/monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim): Monokai Pro theme for Neovim written in Lua, with multiple filters: Pro, Classic, Machine, Octagon, Ristretto, Spectrum  
* [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim): NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.  
* [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material): Gruvbox with Material Palette  
* [olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim): 🎨 Atom's iconic One Dark theme. Cacheable, fully customisable, Tree-sitter and LSP semantic token support. Comes with variants  
* [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme): Github's Neovim themes  
* [Shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu): Ayu theme for Neovim.  
* [scottmckendry/cyberdream.nvim](https://github.com/scottmckendry/cyberdream.nvim): 🤖💤 High-contrast, Futuristic & Vibrant Coloursheme for Neovim  
* [e-q/okcolors.nvim](https://github.com/e-q/okcolors.nvim): An OK colorscheme for NeoVim  
* [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim): [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim): Neovim plugin to improve the default vim.ui interfaces  
* [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim): vscode-like pictograms for neovim lsp completion items  
* [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in Lua.  
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
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [luukvbaal/statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim): Status column plugin that provides a configurable 'statuscolumn' and click handlers.  
* [AckslD/nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua): Clipboard manager neovim plugin with telescope integration  
* [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim): Peek lines just when you intend  
* [tpope/vim-rails](https://github.com/tpope/vim-rails): rails.vim: Ruby on Rails power tools  
* [tpope/vim-abolish](https://github.com/tpope/vim-abolish): abolish.vim: Work with several variants of a word at once  
* [tpope/vim-bundler](https://github.com/tpope/vim-bundler): bundler.vim: Lightweight support for Ruby's Bundler  
* [tpope/vim-endwise](https://github.com/tpope/vim-endwise): endwise.vim: Wisely add  
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch): dispatch.vim: Asynchronous build and test dispatcher  
* [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth): sleuth.vim: Heuristically set buffer options  
* [tpope/vim-repeat](https://github.com/tpope/vim-repeat): repeat.vim: enable repeating supported plugin maps with "."  
* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and vim splits  
* [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags): A Vim plugin that manages your tag files  
* [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim): ✅ Highlight, list and search todo comments in your projects  
* [folke/which-key.nvim](https://github.com/folke/which-key.nvim): 💥 Create key bindings that stick. WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible keybindings of the command you started typing.  
* [airblade/vim-rooter](https://github.com/airblade/vim-rooter): Changes Vim working directory to project root.  
* [jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggles between hybrid and absolute line numbers automatically  
* [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim): 🧘 Distraction-free coding for Neovim  
* [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim): 🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows  
* [chrisbra/csv.vim](https://github.com/chrisbra/csv.vim): A Filetype plugin for csv files  
* [kazhala/close-buffers.nvim](https://github.com/kazhala/close-buffers.nvim): 📑 Delete multiple vim buffers based on different conditions  
* [folke/twilight.nvim](https://github.com/folke/twilight.nvim): 🌅 Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.  
* [zdharma-continuum/zinit-vim-syntax](https://github.com/zdharma-continuum/zinit-vim-syntax): A Vim syntax definition for Zinit commands in any ft=zsh file  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [chrisgrieser/nvim-spider](https://github.com/chrisgrieser/nvim-spider): Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.  
* [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre): Find the enemy and replace them with dark power.  
* [folke/trouble.nvim](https://github.com/folke/trouble.nvim): 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.  
* [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate): illuminate.vim - (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.  
* [folke/edgy.nvim](https://github.com/folke/edgy.nvim): Easily create and manage predefined window layouts, bringing a new edge to your workflow  
* [folke/flash.nvim](https://github.com/folke/flash.nvim): Navigate your code with search labels, enhanced character motions and Treesitter integration  
* [smoka7/multicursors.nvim](https://github.com/smoka7/multicursors.nvim): A multi cursor plugin for Neovim.  
* [otavioschwanck/arrow.nvim](https://github.com/otavioschwanck/arrow.nvim): Bookmark your files, separated by project, and quickly navigate through them.  
* [ton/vim-bufsurf](https://github.com/ton/vim-bufsurf): Vim plugin that enables surfing through buffers based on viewing history per window  
* [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors): Highlight colors for neovim  
* [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim): Single tabpage interface for easily cycling through diffs for all modified files for any git rev.  
* [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim): A better user experience for viewing and interacting with Vim marks.  
* [NeogitOrg/neogit](https://github.com/NeogitOrg/neogit): An interactive and powerful Git interface for Neovim, inspired by Magit  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim): Single tabpage interface for easily cycling through diffs for all modified files for any git rev.  
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Find, Filter, Preview, Pick. All lua, all the time.  
* [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua): Improved fzf.vim written in lua  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Find, Filter, Preview, Pick. All lua, all the time.  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [m4xshen/hardtime.nvim](https://github.com/m4xshen/hardtime.nvim): A Neovim plugin helping you establish good command workflow and quit bad habit  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [gen740/SmoothCursor.nvim](https://github.com/gen740/SmoothCursor.nvim):   

**PLUGINS AS MODULE**  

* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers  
* [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim): 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more  
* [folke/noice.nvim](https://github.com/folke/noice.nvim): 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.  
* [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify): A fancy, configurable, notification manager for NeoVim  
* [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A blazing fast and easy to configure neovim statusline plugin written in pure lua.  
* [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua): Improved fzf.vim written in lua  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [shellRaining/hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim): This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed  
* [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap): Debug Adapter Protocol client implementation for Neovim  
* [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio): A library for asynchronous IO in Neovim  
* [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui): A UI for nvim-dap  
* [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text):   
* [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): Neovim plugin to manage the file system and other tree like structures.  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [mrbjarksen/neo-tree-diagnostics.nvim](https://github.com/mrbjarksen/neo-tree-diagnostics.nvim): A diagnostics source for neo-tree.nvim  
* [3rd/image.nvim](https://github.com/3rd/image.nvim): 🖼️ Bringing images to Neovim.  
* [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod): dadbod.vim: Modern database interface for Vim  
* [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui): Simple UI for https://github.com/tpope/vim-dadbod  
* [kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion): Database autocompletion powered by https://github.com/tpope/vim-dadbod  
* [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim): Neovim file explorer: edit your filesystem like a buffer  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): lua `fork` of vim-web-devicons for neovim  
* [SirZenith/oil-vcs-status](https://github.com/SirZenith/oil-vcs-status): Version control system file status symbol in oil.nvim buffer.  
* [rolv-apneseth/tfm.nvim](https://github.com/rolv-apneseth/tfm.nvim): Neovim plugin for terminal file manager integration  
* [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim):   
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configs for Nvim LSP  
* [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.  
* [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.  
* [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): nvim-cmp source for neovim builtin LSP client  
* [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): nvim-cmp source for neovim builtin LSP client  
* [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic): Simple winbar/statusline plugin that shows your current code context  
* [akinsho/nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua): A neovim lua plugin to help easily manage multiple terminal windows  
* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): autopairs for neovim written in lua  
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Find, Filter, Preview, Pick. All lua, all the time.  
* [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim): [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [cljoly/telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim): 🦘 Jump into the repositories (git, mercurial…) of your filesystem with telescope.nvim, without any setup  
* [nvim-telescope/telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim): Integration for nvim-dap with telescope.nvim  
* [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim): FZF sorter for telescope written in c  
* [fdschmidt93/telescope-egrepify.nvim](https://github.com/fdschmidt93/telescope-egrepify.nvim): Variable user customization for telescope.live_grep to set rg flags on-the-fly  
* [jvgrootveld/telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide): An extension for telescope.nvim that allows you operate zoxide within Neovim.  
* [machakann/vim-sandwich](https://github.com/machakann/vim-sandwich): Set of operators and textobjects to search/select/edit sandwiched texts.  
