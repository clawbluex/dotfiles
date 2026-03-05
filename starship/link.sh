#!/usr/bin/env bash

curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$curdir"

CONFIG_DIR="${XDG_CONFIG_HOME:=$HOME/.config}/starship"
mkdir -p "${CONFIG_DIR}"

# Link preset files
PRESET_FILES=$(cat <<EOF
catppuccin-powerline.toml
jetpack.toml
p10k.toml
pastel-powerline.toml
tokyo-night.toml
EOF
)
while IFS= read -r file <&3 ; do
	[[ -z "$file" ]] && continue
	[[ -e "$file" ]] || continue

	preset="${CONFIG_DIR}/${file}"
	ln -sfnr "${file}" "${preset}" 2>/dev/null || ln -sfn "${curdir}/${file}" "${preset}"
done 3<<< "$PRESET_FILES"
