#!/usr/bin/env bash

curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$curdir"

CONFIG_DIR="${XDG_CONFIG_HOME:=$HOME/.config}/git"

mkdir -p "${CONFIG_DIR}"

ln -sfnr config "${CONFIG_DIR}/config" 2>/dev/null || \
	ln -sfn "${curdir}/config" "${CONFIG_DIR}/config"
ln -sfnr ignore "${CONFIG_DIR}/ignore" 2>/dev/null || \
	ln -sfn "${curdir}/ignore" "${CONFIG_DIR}/ignore"

[ -f ~/.gitconfig ] || cp dot.gitconfig ~/.gitconfig
