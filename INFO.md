    ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗  
    ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝  
    ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗  
    ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝  
    ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗  
    ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝  

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
git clone git://github.com:crivotz/nv-ide.git ~/.nv-ide
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

**SUGGESTION**

* Font: [Fira Code Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
* [dot_files](https://github.com/crivotz/dot_files)
