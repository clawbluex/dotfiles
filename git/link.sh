#!/usr/bin/env bash

if ! command -v delta &> /dev/null; then
	>&2 echo "Error: delta is required but not installed"
	>&2 echo "Install with: apt-get install git-delta (Linux) or brew install git-delta (macOS)"
	exit 1
fi

curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$curdir"

CONFIG_DIR="${XDG_CONFIG_HOME:=$HOME/.config}/git"
mkdir -p "${CONFIG_DIR}"

ln -sfnr config "${CONFIG_DIR}/config" 2>/dev/null || \
	ln -sfn "${curdir}/config" "${CONFIG_DIR}/config"
ln -sfnr ignore "${CONFIG_DIR}/ignore" 2>/dev/null || \
	ln -sfn "${curdir}/ignore" "${CONFIG_DIR}/ignore"

[[ -e "$HOME/.gitconfig" ]] || cp dot.gitconfig "$HOME/.gitconfig"
