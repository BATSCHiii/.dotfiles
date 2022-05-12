# Installations

- ### Zsh
`sudo apt intall zsh`
`chsh -s $(which zsh)` no sudo, relog after


- ### [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

- ### Terminal
`sudo apt install xfce4-terminal`

- ### i3
`sudo apt install i3`
xrandr --output Virtual1 --mode 1920x1080
[Disable Win+L on Windows](https://superuser.com/questions/1059511/how-to-disable-winl-in-windows-10)

#### i3 status bar
Setup cronjob to get weather (`crontab -e`)
`*/15 * * * * curl -s "wttr.in/Luebeck?format=3" > ~/.weather.cache`
Install psutil
```
sudp apt install python3-pip
pip install psutil
```
Install a [Nerd Font](https://www.nerdfonts.com/font-downloads)
```
mv ~/.fonts
unzip <font>
fc-cache -fv
```



- ### NeoVim
[Download from](https://github.com/neovim/neovim/releases/)
```
tar xvfz nvim-linux64.tar.gz
sudo mv nvim-linux64 /usr/local/
:PackerInstall
```

# Install .dotfiles
```
cd ~
git clone git@github.com:BATSCHiii/.dotfiles.git
sudo apt install stow
stow nvim
stow zsh
```


# LaTeX
- Install with
`sudo apt install texlive texlive-science texlive-pictures`
- Compile with 
`pdflatex <file>.tex`

### Install packages
- Download package from CTAN and unzip
- `tex <package>.dtx` or `tex <package>.in`
- `mv <folder> /usr/share/texlive/texmf-dist/tex/latex`
- `sudo texhash`


### Misc
#### Rust Analyzer
- `rustup +nightly component add rust-analyzer-preview`

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
