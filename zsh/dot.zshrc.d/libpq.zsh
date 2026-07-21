HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}

# brew install libpq
if [ -d "${HOMEBREW_PREFIX}/opt/libpq" ]; then
	case ":$PATH:" in
		*:"${HOMEBREW_PREFIX}/opt/libpq/bin":*) ;;
		*) path=("${HOMEBREW_PREFIX}/opt/libpq/bin" $path) ;;
	esac
fi


