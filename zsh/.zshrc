export PATH=$HOME/bin:/usr/local/bin:/usr/local/nvim-linux64/bin/:~/Desktop/rocket-riscv-toolchain/bin/:$PATH

#export SYSTEMC_HOME=/usr/local/systemc-2.3.3
#export LD_LIBRARY_PATH=/usr/local/systemc-2.3.3/lib-linux64
#export SYSTEMC_INCLUDE=/usr/local/systemc-2.3.3/include/
#export SYSTEMC_LIBDIR=/usr/local/systemc-2.3.3/lib-macosxarm/

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export RISCV="$HOME/Desktop/rocket-riscv-toolchain/"

~/.dotfiles/keyremaps/coding

ZSH_THEME="robbyrussell"

source /tools/Xilinx/Vivado/2023.2/settings64.sh
source $ZSH/oh-my-zsh.sh
alias vim="nvim"
alias webex="/opt/Webex/bin/CiscoCollabHost %U"
alias joplin="~/Applications/Joplin-2.12.19_3f961670a2cb4b7ece8549a04209eb66.AppImage"
alias librewolf="~/Applications/LibreWolf.x86_64_2dbeb851f630476ba751a759ae250217.AppImage"

#alias rustdoc="rustup doc --toolchain=stable-x86_64-apple-darwin" 

source ~/.fzf.zsh
