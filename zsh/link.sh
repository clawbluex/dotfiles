#!/usr/bin/env bash

curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$curdir"

ln -sfnr dot.zshrc ~/.zshrc 2>/dev/null || ln -sfn "${curdir}/dot.zshrc" ~/.zshrc
