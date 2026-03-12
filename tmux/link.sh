#!/usr/bin/env bash

curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$curdir"

# dot files
DOT_FILES=$(cat <<EOF
dot.tmux.conf
dot.tmux.conf.local
EOF
)

while IFS= read -r file <&3 ; do
	[[ -z "$file" ]] && continue
	[[ -e "$file" ]] || continue

	dotfile="${file#dot}"
	case "$dotfile" in
		*.local)
			[[ -f "$HOME/$dotfile" ]] || cp "$file" "$HOME/$dotfile"
			;;
		*)
			ln -sfnr "$file" "$HOME/$dotfile" 2>/dev/null || ln -sfn "$curdir/$file" "$HOME/$dotfile"
			;;
	esac
done 3<<< "$DOT_FILES"

# config directories
CONFIG_DIR="${XDG_CONFIG_HOME:=$HOME/.config}/tmux"
CACHE_DIR="${XDG_CACHE_HOME:=$HOME/.cache}/tmux"
mkdir -p "${CONFIG_DIR}/plugins"
mkdir -p "${CACHE_DIR}"

if [ ! -d "${CONFIG_DIR}/plugins/catppuccin" ]; then
	git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "${CONFIG_DIR}/plugins/catppuccin"
fi
