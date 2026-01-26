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
* Terminal that supports ligatures for proper representation

**SUGGESTION**

* Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
* [dot_files](https://github.com/crivotz/dot_files)

**PLUGINS**  

* [olimorris/codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim): ✨ AI Coding, Vim Style  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [franco-ruggeri/codecompanion-spinner.nvim](https://github.com/franco-ruggeri/codecompanion-spinner.nvim): Inline spinner for CodeCompanion in Neovim  
* [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua): Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot  
* [copilotlsp-nvim/copilot-lsp](https://github.com/copilotlsp-nvim/copilot-lsp): Copilot LSP: A lightweight and extensible Neovim plugin for integrating GitHub Copilot's AI-powered code suggestions via Language Server Protocol (LSP).  
* [folke/sidekick.nvim](https://github.com/folke/sidekick.nvim): Your Neovim AI sidekick  
* [saghen/blink.cmp](https://github.com/saghen/blink.cmp): Performant, batteries-included completion plugin for Neovim  
* [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets): Set of preconfigured snippets for different languages.  
* [fang2hou/blink-copilot](https://github.com/fang2hou/blink-copilot): ⚙️ Configurable GitHub Copilot blink.cmp source for Neovim  
* [mikavilpas/blink-ripgrep.nvim](https://github.com/mikavilpas/blink-ripgrep.nvim): Ripgrep/gitgrep source for the blink.cmp Neovim completion plugin  
* [ton/vim-bufsurf](https://github.com/ton/vim-bufsurf): Vim plugin that enables surfing through buffers based on viewing history per window  
* [esmuellert/codediff.nvim](https://github.com/esmuellert/codediff.nvim): A Neovim plugin that provides VSCode-style side-by-side diff rendering with two-tier highlighting (line + character level) using VSCode's algorithm implemented in C.  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [Shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu): Ayu theme for Neovim.  
* [catppuccin/nvim](https://github.com/catppuccin/nvim): 🍨 Soothing pastel theme for (Neo)vim  
* [scottmckendry/cyberdream.nvim](https://github.com/scottmckendry/cyberdream.nvim): 🤖💤 High-contrast, Futuristic & Vibrant Neovim Colorscheme  
* [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme): GitHub's Neovim themes  
* [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material): Gruvbox with Material Palette  
* [rebelot/kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim): NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.  
* [loctvl842/monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim): Monokai Pro theme for Neovim written in Lua, with multiple filters: Pro, Classic, Machine, Octagon, Ristretto, Spectrum  
* [e-q/okcolors.nvim](https://github.com/e-q/okcolors.nvim): An OK colorscheme for NeoVim  
* [olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim): 🎨 Atom's iconic One Dark theme. Cacheable, fully customisable, Tree-sitter and LSP semantic token support. Comes with variants  
* [rose-pine/neovim](https://github.com/rose-pine/neovim): Soho vibes for Neovim  
* [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim): 🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.  
* [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod): dadbod.vim: Modern database interface for Vim  
* [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui): Simple UI for https://github.com/tpope/vim-dadbod  
* [kristijanhusak/vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion): Database autocompletion powered by https://github.com/tpope/vim-dadbod  
* [Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim): IDE-like breadcrumbs, out of the box  
* [folke/edgy.nvim](https://github.com/folke/edgy.nvim): Easily create and manage predefined window layouts, bringing a new edge to your workflow  
* [folke/flash.nvim](https://github.com/folke/flash.nvim): Navigate your code with search labels, enhanced character motions and Treesitter integration  
* [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim): No description provided  
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers  
* [MagicDuck/grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim): Find And Replace plugin for neovim  
* [TheNoeTrevino/haunt.nvim](https://github.com/TheNoeTrevino/haunt.nvim): Ghost text bookmarks for Neovim  
* [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim): [WIP] An implementation of the Popup API from vim in Neovim. Hope to upstream when complete  
* [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim): plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.  
* [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim): UI Component Library for Neovim.  
* [tpope/vim-abolish](https://github.com/tpope/vim-abolish): abolish.vim: Work with several variants of a word at once  
* [tpope/vim-bundler](https://github.com/tpope/vim-bundler): bundler.vim: Lightweight support for Ruby's Bundler  
* [tpope/vim-endwise](https://github.com/tpope/vim-endwise): endwise.vim: Wisely add  
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch): dispatch.vim: Asynchronous build and test dispatcher  
* [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth): sleuth.vim: Heuristically set buffer options  
* [tpope/vim-repeat](https://github.com/tpope/vim-repeat): repeat.vim: enable repeating supported plugin maps with "."  
* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and vim splits  
* [jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): Toggles between hybrid and absolute line numbers automatically  
* [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim): 🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows  
* [chrisbra/csv.vim](https://github.com/chrisbra/csv.vim): A Filetype plugin for csv files  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate): illuminate.vim - (Neo)Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.  
* [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A blazing fast and easy to configure neovim statusline plugin written in pure lua.  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [folke/sidekick.nvim](https://github.com/folke/sidekick.nvim): Your Neovim AI sidekick  
* [yousefhadder/markdown-plus.nvim](https://github.com/yousefhadder/markdown-plus.nvim): The full Markdown editing experience in neovim  
* [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim): A hackable markdown, Typst, latex, html(inline) & Asciidoc previewer for Neovim  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.  
* [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim): Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.  
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configs for Nvim LSP  
* [folke/noice.nvim](https://github.com/folke/noice.nvim): 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.  
* [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim): Peek lines just when you intend  
* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs): autopairs for neovim written in lua  
* [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap): Debug Adapter Protocol client implementation for Neovim  
* [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio): A library for asynchronous IO in Neovim  
* [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui): A UI for nvim-dap  
* [theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text): No description provided  
* [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify): A fancy, configurable, notification manager for NeoVim  
* [chrisgrieser/nvim-rip-substitute](https://github.com/chrisgrieser/nvim-rip-substitute): Search and replace in the current buffer with incremental preview, a convenient UI, and modern regex syntax.  
* [chrisgrieser/nvim-spider](https://github.com/chrisgrieser/nvim-spider): Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.  
* [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim): Neovim file explorer: edit your filesystem like a buffer  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [SirZenith/oil-vcs-status](https://github.com/SirZenith/oil-vcs-status): Version control system file status symbol in oil.nvim buffer.  
* [eero-lehtinen/oklch-color-picker.nvim](https://github.com/eero-lehtinen/oklch-color-picker.nvim): A graphical color picker and highlighter for Neovim  
* [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim): Plugin to improve viewing Markdown files in Neovim  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins  
* [machakann/vim-sandwich](https://github.com/machakann/vim-sandwich): Set of operators and textobjects to search/select/edit sandwiched texts.  
* [2kabhishek/seeker.nvim](https://github.com/2kabhishek/seeker.nvim): Progressive file seeker for Neovim 🔍🎯  
* [folke/snacks.nvim](https://github.com/folke/snacks.nvim): 🍿 A collection of QoL plugins for Neovim  
* [folke/snacks.nvim](https://github.com/folke/snacks.nvim): 🍿 A collection of QoL plugins for Neovim  
* [rolv-apneseth/tfm.nvim](https://github.com/rolv-apneseth/tfm.nvim): Neovim plugin for terminal file manager integration  
* [rachartier/tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim): A Neovim plugin for displaying inline diagnostic messages with customizable styles and icons.  
* [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim): ✅ Highlight, list and search todo comments in your projects  
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Nvim Treesitter configurations and abstraction layer  
* [folke/trouble.nvim](https://github.com/folke/trouble.nvim): 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.  
* [folke/snacks.nvim](https://github.com/folke/snacks.nvim): 🍿 A collection of QoL plugins for Neovim  
* [tpope/vim-rails](https://github.com/tpope/vim-rails): rails.vim: Ruby on Rails power tools  
* [airblade/vim-rooter](https://github.com/airblade/vim-rooter): Changes Vim working directory to project root.  
* [folke/which-key.nvim](https://github.com/folke/which-key.nvim): 💥 Create key bindings that stick. WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type.  
