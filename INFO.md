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

![v-ide startify](https://raw.githubusercontent.com/crivotz/v-ide/master/nv-ide_screenshot.png)
![v-ide + fern + coc](https://raw.githubusercontent.com/crivotz/nv-ide/master/v-ide_screenshot_1.png)
![v-ide + fzf ](https://raw.githubusercontent.com/crivotz/nv-ide/master/v-ide_screenshot_2.png)
![v-ide + fzf ](https://raw.githubusercontent.com/crivotz/nv-ide/master/v-ide_screenshot_3.png)

---

**SYNTAX**

Check [vim-polyglot](https://github.com/sheerun/vim-polyglot) for full list.  

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

**SUGGESTION**

* Font: [Fira Code Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
