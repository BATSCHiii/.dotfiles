export PATH=$HOME/bin:/usr/local/bin:/usr/local/nvim-linux64/bin/:$PATH

export SYSTEMC_HOME=/usr/local/systemc-2.3.3
export LD_LIBRARY_PATH=/usr/local/systemc-2.3.3/lib-linux64
#export SYSTEMC_INCLUDE=/usr/local/systemc-2.3.3/include/
#export SYSTEMC_LIBDIR=/usr/local/systemc-2.3.3/lib-macosxarm/

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

~/.dotfiles/keyremaps/coding

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias rustdoc="rustup doc --toolchain=stable-x86_64-apple-darwin" 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
