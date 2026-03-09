# add ~/.cargo/bin to path
[[ -s "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"
if [ -d "${HOME}/.cargo/bin" ]; then
	case ":$PATH:" in
		*:"${HOME}/.cargo/bin":*) ;;
		*) path=("${HOME}/.cargo/bin" $path) ;;
	esac
fi

