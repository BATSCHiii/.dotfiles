# Installations 

- ### Zsh

- ### [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

- ### [Vimplug](https://github.com/junegunn/vim-plug)
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

# Install .dotfiles
```
cd ~
git clone git@github.com:BATSCHiii/.dotfiles.git
stow nvim
stow zsh
```

