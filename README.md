# Installations 

- ### Zsh

- ### [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

- ### [Vimplug](https://github.com/junegunn/vim-plug)
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

- ### [Zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`


# Install .dotfiles
```
cd ~
git clone git@github.com:BATSCHiii/.dotfiles.git
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
