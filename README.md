<p align="center">
  <img src="https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/NV-IDE.svg?raw=true"/>
</p>

**In the near future, branch `move_to_lazyvim` will become the official `main` branch, while `nv_ide_original` will retain the original version without LazyVim as its core.**

[Neovim](https://neovim.io/) LUA configuration, oriented for web developers (rails, ruby, php, html, css, SCSS, javascript).  
I use this repository mainly to keep track of the changes that I made on my Neovim configuration, but I hope that it will be useful to other  
The project is constantly changing  
Moved to [LazyVim](https://github.com/LazyVim/LazyVim) as core

- You can find old independent version on the branch `nv_ide_original`
- You can find old no-lua and coc version under branch `old_coc_version`
- You can find old packer version under branch `old_packer`

Thanks to Folke and to the developers of these amazing plugins/colors

![nv-ide](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_0.png)
![nv-ide + terminal](https://raw.githubusercontent.com/crivotz/nv-ide/master/screenshots/nv-ide_screenshot_1.png)

---

# INSTALLATION

```console
git clone --depth 1 https://github.com/crivotz/nv-ide.git ~/.nv-ide
cd ~/.config
ln -s ~/.nv-ide nvim
nvim
```

# DEPENDENCIES

- Neovim
- [LazyVim](https://github.com/LazyVim/LazyVim)

# SUGGESTIONS

- Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- [dot_files](https://github.com/crivotz/dot_files)

**PLUGINS** -

- [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim): Neovim config for the lazy and its defaults

- **LazyVim Extra**: `lazyvim.plugins.extras.ai.sidekick`
- **LazyVim Extra**: `lazyvim.plugins.extras.coding.mini-surround`
- **LazyVim Extra**: `lazyvim.plugins.extras.coding.yanky`
- **LazyVim Extra**: `lazyvim.plugins.extras.ui.edgy`

- [esmuellert/codediff.nvim](https://github.com/esmuellert/codediff.nvim): A Neovim plugin that provides VSCode-style diff rendering with two-tier highlighting (line + character level) in side-by-side and inline layouts, using VSCode's algorithm implemented in C.
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configs for Nvim LSP
- [TheNoeTrevino/haunt.nvim](https://github.com/TheNoeTrevino/haunt.nvim): Ghost text bookmarks for Neovim
- [nacro90/numb.nvim](https://github.com/nacro90/numb.nvim): Peek lines just when you intend
- [chrisgrieser/nvim-rip-substitute](https://github.com/chrisgrieser/nvim-rip-substitute): Search & replace in the current buffer or workspace with incremental preview, a convenient UI, and modern regex syntax.
- [chrisgrieser/nvim-spider](https://github.com/chrisgrieser/nvim-spider): Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.
- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim): Neovim file explorer: edit your filesystem like a buffer
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Provides Nerd Font icons (glyphs) for use by neovim plugins
- [SirZenith/oil-vcs-status](https://github.com/SirZenith/oil-vcs-status): Version control system file status symbol in oil.nvim buffer.
- [lambdalisue/suda.vim](https://github.com/lambdalisue/suda.vim): 🥪 An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows
- [tpope/vim-abolish](https://github.com/tpope/vim-abolish): abolish.vim: Work with several variants of a word at once
- [tpope/vim-endwise](https://github.com/tpope/vim-endwise): endwise.vim: Wisely add
- [jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle): No description provided
- [tpope/vim-rails](https://github.com/tpope/vim-rails): rails.vim: Ruby on Rails power tools
- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): Seamless navigation between tmux panes and vim splits
