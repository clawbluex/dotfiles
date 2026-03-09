# mise completion requires [`usage`](https://github.com/jdx/usage) command.
# use one of the following command to install `usage`
#  brew install usage
#  cargo install usage-cli
#  cargo binstall usage-cli
#  mise use -g usage

# mise completion zsh > ~/.local/share/zsh/completions/_mise

if (( ${+commands[mise]} )); then
	eval "$(mise activate zsh)"
else
	mise() {
		>&2 echo "mise not installed."
		>&2 echo ""
		>&2 echo "Run the following command to install it."
		>&2 echo "  brew install mise"
		>&2 echo ""
		>&2 echo "Or install manually through the following command"
		>&2 echo "  curl https://mise.run | sh"
	}
fi
