if [ -d ${HOME}/.bun ]; then
    export BUN_INSTALL="$HOME/.bun"
    case ":$PATH:" in
        *:${BUN_INSTALL}/bin:*) ;;
        *) path=(${BUN_INSTALL}/bin $path) ;;
    esac
    # bun completions
    [[ -s "${BUN_INSTALL}/_bun" ]] && source "${BUN_INSTALL}/_bun"
fi
