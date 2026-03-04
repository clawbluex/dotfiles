#!/usr/bin/env bash

curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$curdir"

# dot files
DOT_FILES=$(cat <<EOF
dot.zshenv.local
dot.zprofile.local
dot.zshrc.local
dot.zprofile
dot.zshenv
dot.zshrc
dot.zlogin
dot.zlogout
dot.zshrc.d
EOF
)
while IFS= read -r file <&3 ; do
	[[ -z "$file" ]] && continue
	[[ -e "$file" ]] || continue

	dotfile="${file/dot}"
	case "$dotfile" in
		*.local)
			[[ -f "$HOME/$dotfile" ]] || cp "$file" "$HOME/$dotfile"
			;;
		*)
			ln -sfnr "$file" "$HOME/$dotfile" 2>/dev/null || ln -sfn "$curdir/$file" "$HOME/$dotfile"
			;;
	esac
done 3<<< "$DOT_FILES"

