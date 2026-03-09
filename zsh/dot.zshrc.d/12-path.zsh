# add ~/opt/bin to path
if [ -d "${HOME}/opt/bin" ]; then
	case ":$PATH:" in
		*:"${HOME}/opt/bin":*) ;;
		*) path=("${HOME}/opt/bin" $path) ;;
	esac
fi

# add ~/.local/bin to path
if [ -d "${HOME}/.local/bin" ]; then
	case ":$PATH:" in
		*:"${HOME}/.local/bin":*) ;;
		*) path=("${HOME}/.local/bin" $path) ;;
	esac
fi

