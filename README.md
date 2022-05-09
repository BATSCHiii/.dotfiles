# Installations 

- ### Zsh

- ### [Oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

- ### Terminal
`sudo apt install xfce4-terminal`

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
