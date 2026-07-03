HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}

# brew install rustup
if [ -d "${HOMEBREW_PREFIX}/opt/rustup" ]; then
	case ":$PATH:" in
		*:"${HOMEBREW_PREFIX}/opt/rustup/bin":*) ;;
		*) path=("${HOMEBREW_PREFIX}/opt/rustup/bin" $path) ;;
	esac
fi

# add ~/.cargo/bin to path
[[ -s "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"
if [ -d "${HOME}/.cargo/bin" ]; then
	case ":$PATH:" in
		*:"${HOME}/.cargo/bin":*) ;;
		*) path=("${HOME}/.cargo/bin" $path) ;;
	esac
fi

