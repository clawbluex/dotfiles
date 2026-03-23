if (( ${+commands[ngrok]} )); then
	eval "$(ngrok completion)"
else
	ngrok() {
		>&2 echo "ngrok not installed."
		>&2 echo ""
		>&2 echo "Run the following command to install it."
		>&2 echo "  brew install ngrok"
		>&2 echo ""
		>&2 echo "Or install manually through the following website"
		>&2 echo "  https://ngrok.com/download"
	}
fi

