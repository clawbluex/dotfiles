HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}

# brew install imagemagick-full
if [ -d "${HOMEBREW_PREFIX}/opt/imagemagick-full/bin" ]; then
	case ":$PATH:" in
		*:"${HOMEBREW_PREFIX}/opt/imagemagick-full/bin":*) ;;
		*) path=("${HOMEBREW_PREFIX}/opt/imagemagick-full/bin" $path) ;;
	esac
fi
