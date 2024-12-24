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
* [FZF](https://github.com/junegunn/fzf)
* [ripgrep](https://github.com/BurntSushi/ripgrep): ripgrep recursively searches directories for a regex pattern  
* [Ripper-tags](https://github.com/tmm1/ripper-tags)
* [prettierd](https://github.com/fsouza/prettierd) for formatter.nvim install via Mason `MasonInstall prettierd`
* Needed DAP, show `lua/plugins/nvim-dap.lua` install via Mason for `node` with `MasonInstall node-debug2-adapter`
* Needed LSP, show `lua/lsp/init.lua` installed automatically with Mason
* Plocate 
* Terminal that supports ligatures for proper representation

**SUGGESTION**

* Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
* [dot_files](https://github.com/crivotz/dot_files)

**PLUGINS**  

* [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim): Neovim plugin to improve the default vim.ui interfaces  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua): Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot  
* [HakonHarnes/img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim): Effortlessly embed images into any markup language, like LaTeX, Markdown or Typst  
* [saghen/blink.cmp](https://github.com/saghen/blink.cmp): Performant, batteries-included completion plugin for Neovim  
* [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets): Set of preconfigured snippets for different languages.  
* [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua): Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot  
* [giuxtaposition/blink-cmp-copilot](https://github.com/giuxtaposition/blink-cmp-copilot): No description provided  
* [mikavilpas/blink-ripgrep.nvim](https://github.com/mikavilpas/blink-ripgrep.nvim): Ripgrep source for the blink.cmp Neovim completion plugin  
* [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim): 🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.  
* [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua): Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot  
* [CopilotC-Nvim/CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim): Chat with GitHub Copilot in Neovim  
* [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua): Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod): dadbod.vim: Modern database interface for Vim  
* [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui): Simple UI for https://github.com/tpope/vim-dadbod  
* [kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion): Database autocompletion powered by https://github.com/tpope/vim-dadbod  
* [folke/edgy.nvim](https://github.com/folke/edgy.nvim): Easily create and manage predefined window layouts, bringing a new edge to your workflow  
* [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim): No description provided  
* [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua): Improved fzf.vim written in lua  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers  
* [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim): [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim): Neovim plugin to improve the default vim.ui interfaces  
* [onsails/lspkind-nvim](https://github.com/onsails/lspkind-nvim): vscode-like pictograms for neovim lsp completion items  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [AckslD/nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua): Clipboard manager neovim plugin with telescope integration  
* [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua): Improved fzf.vim written in lua  
* [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim): Peek lines just when you intend  
* [weizheheng/ror.nvim](https://github.com/weizheheng/ror.nvim): Have FUN builiding Ruby on Rails applications with Neovim!  
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
* [folke/which-key.nvim](https://github.com/folke/which-key.nvim): 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.  
* [airblade/vim-rooter](https://github.com/airblade/vim-rooter): Changes Vim working directory to project root.  
* [jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggles between hybrid and absolute line numbers automatically  
* [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim): 🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows  
* [chrisbra/csv.vim](https://github.com/chrisbra/csv.vim): A Filetype plugin for csv files  
* [zdharma-continuum/zinit-vim-syntax](https://github.com/zdharma-continuum/zinit-vim-syntax): A Vim syntax definition for Zinit commands in any ft=zsh file  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [chrisgrieser/nvim-spider](https://github.com/chrisgrieser/nvim-spider): Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.  
* [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim): Find And Replace plugin for neovim  
* [folke/trouble.nvim](https://github.com/folke/trouble.nvim): 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.  
* [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate): illuminate.vim - (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.  
* [folke/flash.nvim](https://github.com/folke/flash.nvim): Navigate your code with search labels, enhanced character motions and Treesitter integration  
* [otavioschwanck/arrow.nvim](https://github.com/otavioschwanck/arrow.nvim): Bookmark your files, separated by project, and quickly navigate through them.  
* [ton/vim-bufsurf](https://github.com/ton/vim-bufsurf): Vim plugin that enables surfing through buffers based on viewing history per window  
* [eero-lehtinen/oklch-color-picker.nvim](https://github.com/eero-lehtinen/oklch-color-picker.nvim): A graphical color picker and highlighter for Neovim  
* [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim): Single tabpage interface for easily cycling through diffs for all modified files for any git rev.  
* [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim): A better user experience for viewing and interacting with Vim marks.  
* [m4xshen/hardtime.nvim](https://github.com/m4xshen/hardtime.nvim): Establish good command workflow and quit bad habit  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [chrisgrieser/nvim-rip-substitute](https://github.com/chrisgrieser/nvim-rip-substitute): Search and replace in the current buffer with incremental preview, a convenient UI, and modern regex syntax.  
* [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim): ☄️ Highly customisable markdown(latex & inline html) previewer for Neovim  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [folke/noice.nvim](https://github.com/folke/noice.nvim): 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.  
* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): autopairs for neovim written in lua  
* [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap): Debug Adapter Protocol client implementation for Neovim  
* [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio): A library for asynchronous IO in Neovim  
* [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui): A UI for nvim-dap  
* [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text): No description provided  
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configs for Nvim LSP  
* [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.  
* [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.  
* [saghen/blink.cmp](https://github.com/saghen/blink.cmp): Performant, batteries-included completion plugin for Neovim  
* [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic): Simple winbar/statusline plugin that shows your current code context  
* [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify): A fancy, configurable, notification manager for NeoVim  
* [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim): Neovim file explorer: edit your filesystem like a buffer  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [SirZenith/oil-vcs-status](https://github.com/SirZenith/oil-vcs-status): Version control system file status symbol in oil.nvim buffer.  
* [machakann/vim-sandwich](https://github.com/machakann/vim-sandwich): Set of operators and textobjects to search/select/edit sandwiched texts.  
* [folke/snacks.nvim](https://github.com/folke/snacks.nvim): 🍿 A collection of small QoL plugins for Neovim  
* [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim): [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [rolv-apneseth/tfm.nvim](https://github.com/rolv-apneseth/tfm.nvim): Neovim plugin for terminal file manager integration  

* [Shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu): Ayu theme for Neovim.  
* [scottmckendry/cyberdream.nvim](https://github.com/scottmckendry/cyberdream.nvim): 🤖💤 High-contrast, Futuristic & Vibrant Coloursheme for Neovim  
* [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme): GitHub's Neovim themes  
* [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material): Gruvbox with Material Palette  
* [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim): NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.  

**COLORSCHEMES**  

* [loctvl842/monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim): Monokai Pro theme for Neovim written in Lua, with multiple filters: Pro, Classic, Machine, Octagon, Ristretto, Spectrum  
* [e-q/okcolors.nvim](https://github.com/e-q/okcolors.nvim): An OK colorscheme for NeoVim  
* [olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim): 🎨 Atom's iconic One Dark theme. Cacheable, fully customisable, Tree-sitter and LSP semantic token support. Comes with variants  
* [rose-pine/neovim](https://github.com/rose-pine/neovim): Soho vibes for Neovim  

**EXTRA (actually disabled)**  

* [yetone/avante.nvim](https://github.com/yetone/avante.nvim): Use your Neovim like using Cursor AI IDE!  
* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Find, Filter, Preview, Pick. All lua, all the time.  
* [cljoly/telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim): 🦘 Jump into the repositories (git, mercurial…) of your filesystem with telescope.nvim, without any setup  
* [nvim-telescope/telescope-dap.nvim](https://github.com/nvim-telescope/telescope-dap.nvim): Integration for nvim-dap with telescope.nvim  
* [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim): FZF sorter for telescope written in c  
* [nvim-telescope/telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim): Live grep with args  
