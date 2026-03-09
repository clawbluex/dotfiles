# add ~/go/bin to path
mkdir -p "${HOME}/go/bin"
mkdir -p "${HOME}/go/pkg"
mkdir -p "${HOME}/go/src"

if [ -d "${HOME}/go" ]; then
	export GOPATH="${HOME}/go"
	case ":$PATH:" in
		*:"${GOPATH}/bin":*) ;;
		*) path=("${GOPATH}/bin" $path) ;;
	esac
fi

