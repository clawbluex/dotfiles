# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000000 # Number of lines of history kept within the shell
SAVEHIST=1000000000 # Number of lines of history to save to $HISTFILE

setopt autocd extendedglob
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/clawbluex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
