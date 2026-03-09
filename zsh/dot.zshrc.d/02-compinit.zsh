zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit

# Rebuild .zcompdump if older than 1 hours
for dump in ~/.zcompdump(N.mh+1); do
	>&2 echo "Rebuilding $dump"
	compinit > /dev/null 2>&1
	touch "$dump"
	zcompile "$dump"
done
compinit -C > /dev/null 2>&1

zstyle ':completion:*' menu select

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
	bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

