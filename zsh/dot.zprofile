# .zprofile
# loaded before .zshrc, for login shells only

# Setup brew environment variables
if [[ -z $HOMEBREW_PREFIX ]] && [[ -s /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if [[ -z $HOMEBREW_PREFIX ]] && [[ -s /usr/local/bin/brew ]]; then
	eval "$(/usr/local/bin/brew shellenv)"
fi

# Set the "umask" (see "man umask"):
# umask 002 # relaxed   -rwxrwxr-x
# umask 022 # cautious  -rwxr-xr-x
# umask 027 # uptight   -rwxr-x---
# umask 077 # paranoid  -rwx------
# umask 066 # bofh-like -rw-------
umask 022

# Load local zprofile settings
[[ -r "$HOME/.zprofile.local" ]] && source "$HOME/.zprofile.local"
