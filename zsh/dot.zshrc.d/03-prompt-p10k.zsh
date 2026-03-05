[[ "$ZSH_PROMPT" == 'p10k' ]] || return 0

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# disable gitstatusd
# POWERLEVEL9K_DISABLE_GITSTATUS=true
# *note*
# remove vcs from POWERLEVEL9K_LEFT_PROMPT_ELEMENTS as well
