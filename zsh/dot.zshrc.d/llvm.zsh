HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}

# brew install llvm
# brew install lld
if [ -d "${HOMEBREW_PREFIX}/opt/llvm" ]; then
	export LLVMDIR="${HOMEBREW_PREFIX}/opt/llvm"
	#export CPPFLAGS="-I${LLVMDIR}/include"
	#export LDFLAGS="-L${LLVMDIR}/lib"
	#export LDFLAGS="-L${LLVMDIR}/lib -Wl,-rpath,${LLVMDIR}/lib"
	case ":$PATH:" in
		*:"${LLVMDIR}/bin":*) ;;
		*) path=("${LLVMDIR}/bin" $path) ;;
	esac
fi

