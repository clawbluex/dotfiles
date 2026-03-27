HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}

# brew install ffmpeg-full
if [ -d "${HOMEBREW_PREFIX}/opt/ffmpeg-full" ]; then
	case ":$PATH:" in
		*:"${HOMEBREW_PREFIX}/opt/ffmpeg-full/bin":*) ;;
		*) path=("${HOMEBREW_PREFIX}/opt/ffmpeg-full/bin" $path) ;;
	esac
fi


