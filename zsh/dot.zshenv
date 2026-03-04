# .zshenv
# loaded always, for every invocation (login, interactive, non-interactive, script)

# Load local zshenv settings
[[ -r "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
