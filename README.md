# Installations

- ### Zsh
`sudo apt install zsh`
`chsh -s $(which zsh)` no sudo, relog after
https://github.com/junegunn/fzf#installation

- ### [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`



Zsh comes with colored prompts builtin. Try

autoload -U promptinit && promptinit

and then prompt -l lists available prompts, -p fire previews the "fire" prompt, -s fire sets it.

When you are ready to add a prompt add something like this below the autoload line above:

prompt fade red



- ### Terminal
`sudo apt install xfce4-terminal`

- ### NeoVim
Download from [releasepage](https://github.com/neovim/neovim/releases/)
```
tar xvfz nvim-linux64.tar.gz
sudo mv nvim-linux64 /usr/local/

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

:PackerInstall
```

### Install .dotfiles
```
cd ~
git clone git@github.com:BATSCHiii/.dotfiles.git
sudo apt install stow
stow nvim
stow zsh
```

- ### i3
`sudo apt install i3` \
xrandr --output Virtual1 --mode 1920x1080 \
[Disable Win+L on Windows](https://superuser.com/questions/1059511/how-to-disable-winl-in-windows-10)


#### i3 status bar
Setup cronjob to get weather (`crontab -e`)
`*/15 * * * * curl -s "wttr.in/Luebeck?format=3" > ~/.weather.cache`

Install psutil
```
sudo apt install python3-pip
pip install psutil
```

Install a [Nerd Font](https://www.nerdfonts.com/font-downloads)
(Cousine for i3bar)
```
mv ~/.fonts
unzip <font>
fc-cache -fv
```

Fix username in `~/.config/i3/config` and `~/.config/i3status/mybar.sh` if changed

### Budgie Desktop
https://itsfoss.com/install-budgie-ubuntu/#install-budgie-on-ubuntu
```
sudo apt update && sudo apt upgrade
sudo apt install ubuntu-budgie-desktop
```

### LaTeX
- Install with
`sudo apt install texlive texlive-science texlive-pictures`
- Compile with 
`pdflatex <file>.tex`

#### Install packages
- Download package from CTAN and unzip
- `tex <package>.dtx` or `tex <package>.in`
- `mv <folder> /usr/share/texlive/texmf-dist/tex/latex`
- `sudo texhash`


### Misc
#### Rust Analyzer
- `rustup +nightly component add rust-analyzer-preview`
- `curl -L https://github.com/rust-lang/rust-analyzer/releases/download/2021-06-28/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/usr/local/bin/rust-analyzer`


- ~/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim/lua/lsp_extensions/init.lua rust-analyzer/inlayHints -> textDocument/inlayHint

.ccls file at project root
Example: .ccls from Computergrafik
```
clang

%h -x
%h c++-header
-I
.
-I
./include
-O0 
-g3  
-std=c++11
```

- If nvim doesn't copy to clipboard: `sudo apt install xclip`
