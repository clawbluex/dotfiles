HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}

# brew install curl
if [ -d "${HOMEBREW_PREFIX}/opt/curl" ]; then
	case ":$PATH:" in
		*:"${HOMEBREW_PREFIX}/opt/curl/bin":*) ;;
		*) path=("${HOMEBREW_PREFIX}/opt/curl/bin" $path) ;;
	esac
	case ":$MANPATH:" in
		*:"${HOMEBREW_PREFIX}/opt/curl/share/man":*) ;;
		*) export MANPATH="${HOMEBREW_PREFIX}/opt/curl/share/man":$MANPATH ;;
	esac
fi


