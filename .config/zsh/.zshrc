#!/bin/sh

source $ZDOTDIR/functions

zsh_add_file "zshconfig"

zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

zsh_add_file "aliases"
zsh_add_file "completions"
zsh_add_file "functions"
zsh_add_file "history"
zsh_add_file "loadings"
zsh_add_file "prompt"
zsh_add_file "compinit"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/stylish/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "/home/stylish/.local/share/sdkman/bin/sdkman-init.sh"
