alias cp='cp -i'
alias mv='mv -i'

alias more='less'
alias tree='tree -N'

alias sort='LC_ALL=C sort'
alias uniq='LC_ALL=C uniq'

alias rsync='rsync -avh --progress --stats --no-o'
alias xargs='xargs -o'

[[ $commands[lsd] ]] && alias lsd='lsd -vN'
